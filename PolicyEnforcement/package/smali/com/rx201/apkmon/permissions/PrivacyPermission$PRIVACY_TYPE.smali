.class public final enum Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;
.super Ljava/lang/Enum;
.source "PrivacyPermission.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rx201/apkmon/permissions/PrivacyPermission;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PRIVACY_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Contact:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

.field private static final synthetic ENUM$VALUES:[Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

.field public static final enum GPS_Last:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

.field public static final enum GPS_Proximity:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

.field public static final enum IMEI:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

.field public static final enum IMSI:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

.field public static final enum PhoneNumber:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 9
    new-instance v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    const-string v1, "PhoneNumber"

    invoke-direct {v0, v1, v3}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->PhoneNumber:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    new-instance v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    const-string v1, "IMEI"

    invoke-direct {v0, v1, v4}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->IMEI:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    new-instance v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    const-string v1, "IMSI"

    invoke-direct {v0, v1, v5}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->IMSI:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    new-instance v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    const-string v1, "Contact"

    invoke-direct {v0, v1, v6}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->Contact:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    new-instance v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    const-string v1, "GPS_Last"

    invoke-direct {v0, v1, v7}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->GPS_Last:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    new-instance v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    const-string v1, "GPS_Proximity"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->GPS_Proximity:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->PhoneNumber:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->IMEI:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->IMSI:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    aput-object v1, v0, v5

    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->Contact:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    aput-object v1, v0, v6

    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->GPS_Last:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->GPS_Proximity:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    aput-object v2, v0, v1

    sput-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ENUM$VALUES:[Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    return-object v0
.end method

.method public static values()[Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ENUM$VALUES:[Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    array-length v1, v0

    new-array v2, v1, [Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
