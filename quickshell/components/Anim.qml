import QtQuick

NumberAnimation {
    enum Type {
        StandardSmall = 0,
        Standard,
        StandardLarge,
        StandardExtraLarge,
        EmphasizedSmall,
        Emphasized,
        EmphasizedLarge,
        EmphasizedExtraLarge,
        FastSpatial,
        DefaultSpatial,
        SlowSpatial,
        FastEffects,
        DefaultEffects,
        SlowEffects
    }

    property int type: Anim.DefaultSpatial

    duration: {
	if (type === Anim.DefaultSpatial) return 100;
    }

    easing.type: {
	if (type === Anim.DefaultSpatial) return Easing.OutQuad;
    }
}
