#include <security/pam_appl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>

struct app_data {
    const char *password;
};

static int conversation(
    int num_msg,
    const struct pam_message **msg,
    struct pam_response **resp,
    void *data
) {
    struct app_data *app = data;

    *resp = calloc(num_msg, sizeof(struct pam_response));

    if (*resp == NULL)
        return PAM_CONV_ERR;

    for (int i = 0; i < num_msg; i++) {
        if (msg[i]->msg_style == PAM_PROMPT_ECHO_OFF) {
            (*resp)[i].resp = strdup(app->password);
        } else {
            (*resp)[i].resp = NULL;
        }
    }

    return PAM_SUCCESS;
}

int main(void) {
    char password[1024];

    if (fgets(password, sizeof(password), stdin) == NULL)
        return 1;

    password[strcspn(password, "\n")] = '\0';

    struct app_data app = {
        .password = password
    };

    struct pam_conv conv = {
        .conv = conversation,
        .appdata_ptr = &app
    };

    const char *username = getlogin();

    if (username == NULL) {
        fprintf(stderr, "Could not determine username\n");
        return 1;
    }

    pam_handle_t *pamh = NULL;

    int result = pam_start(
        "login",
        username,
        &conv,
        &pamh
    );

    if (result != PAM_SUCCESS)
        return 1;

    result = pam_authenticate(pamh, 0);

    if (result == PAM_SUCCESS)
        result = pam_acct_mgmt(pamh, 0);

    pam_end(pamh, result);

    if (result == PAM_SUCCESS) {
        puts("OK");
        return 0;
    }

    puts("FAIL");
    return 1;
}
