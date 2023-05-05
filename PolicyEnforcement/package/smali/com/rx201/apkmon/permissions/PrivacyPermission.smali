.class public Lcom/rx201/apkmon/permissions/PrivacyPermission;
.super Lcom/rx201/apkmon/permissions/AurasiumPermission;
.source "PrivacyPermission.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$rx201$apkmon$permissions$PrivacyPermission$PRIVACY_TYPE:[I

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/rx201/apkmon/permissions/PrivacyPermission;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private type:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;


# direct methods
.method static synthetic $SWITCH_TABLE$com$rx201$apkmon$permissions$PrivacyPermission$PRIVACY_TYPE()[I
    .registers 3

    .prologue
    .line 8
    sget-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->$SWITCH_TABLE$com$rx201$apkmon$permissions$PrivacyPermission$PRIVACY_TYPE:[I

    if-eqz v0, :cond_5

    :goto_4
    return-object v0

    :cond_5
    invoke-static {}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->values()[Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_c
    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->Contact:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v1}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_15} :catch_4f

    :goto_15
    :try_start_15
    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->GPS_Last:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v1}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_1e} :catch_4d

    :goto_1e
    :try_start_1e
    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->GPS_Proximity:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v1}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_27} :catch_4b

    :goto_27
    :try_start_27
    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->IMEI:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v1}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_30
    .catch Ljava/lang/NoSuchFieldError; {:try_start_27 .. :try_end_30} :catch_49

    :goto_30
    :try_start_30
    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->IMSI:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v1}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_39
    .catch Ljava/lang/NoSuchFieldError; {:try_start_30 .. :try_end_39} :catch_47

    :goto_39
    :try_start_39
    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->PhoneNumber:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v1}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_42
    .catch Ljava/lang/NoSuchFieldError; {:try_start_39 .. :try_end_42} :catch_45

    :goto_42
    sput-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->$SWITCH_TABLE$com$rx201$apkmon$permissions$PrivacyPermission$PRIVACY_TYPE:[I

    goto :goto_4

    :catch_45
    move-exception v1

    goto :goto_42

    :catch_47
    move-exception v1

    goto :goto_39

    :catch_49
    move-exception v1

    goto :goto_30

    :catch_4b
    move-exception v1

    goto :goto_27

    :catch_4d
    move-exception v1

    goto :goto_1e

    :catch_4f
    move-exception v1

    goto :goto_15
.end method

.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 53
    new-instance v0, Lcom/rx201/apkmon/permissions/PrivacyPermission$1;

    invoke-direct {v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission$1;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 61
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/rx201/apkmon/permissions/AurasiumPermission;-><init>(Landroid/os/Parcel;)V

    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->valueOf(Ljava/lang/String;)Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    move-result-object v0

    iput-object v0, p0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->type:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    .line 21
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/rx201/apkmon/permissions/PrivacyPermission;)V
    .registers 3

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/rx201/apkmon/permissions/PrivacyPermission;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;)V
    .registers 4
    .param p1, "type"    # Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->type:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    .line 29
    invoke-static {}, Lcom/rx201/apkmon/permissions/PrivacyPermission;->$SWITCH_TABLE$com$rx201$apkmon$permissions$PrivacyPermission$PRIVACY_TYPE()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_3c

    .line 49
    const-string v0, "Possible privacy violation: this application is trying to access ?something?, allow or not"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission;->setDescription(Ljava/lang/String;)V

    .line 51
    :goto_17
    return-void

    .line 31
    :pswitch_18
    const-string v0, "Possible privacy violation: this application is trying to access your phone number, allow or not?"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission;->setDescription(Ljava/lang/String;)V

    goto :goto_17

    .line 34
    :pswitch_1e
    const-string v0, "Possible privacy violation: this application is trying to access IMEI, allow or not?"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission;->setDescription(Ljava/lang/String;)V

    goto :goto_17

    .line 37
    :pswitch_24
    const-string v0, "Possible privacy violation: this application is trying to access IMSI, allow or not?"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission;->setDescription(Ljava/lang/String;)V

    goto :goto_17

    .line 40
    :pswitch_2a
    const-string v0, "Possible privacy violation: this application is trying to access contact list, allow or not?"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission;->setDescription(Ljava/lang/String;)V

    goto :goto_17

    .line 43
    :pswitch_30
    const-string v0, "Possible privacy violation: this application is trying to access your location information, allow or not?"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission;->setDescription(Ljava/lang/String;)V

    goto :goto_17

    .line 46
    :pswitch_36
    const-string v0, "Possible privacy violation: this application is trying to access location information, allow or not?"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission;->setDescription(Ljava/lang/String;)V

    goto :goto_17

    .line 29
    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_18
        :pswitch_1e
        :pswitch_24
        :pswitch_2a
        :pswitch_30
        :pswitch_36
    .end packed-switch
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 86
    if-eqz p1, :cond_11

    instance-of v0, p1, Lcom/rx201/apkmon/permissions/PrivacyPermission;

    if-eqz v0, :cond_11

    .line 87
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->type:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    check-cast p1, Lcom/rx201/apkmon/permissions/PrivacyPermission;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lcom/rx201/apkmon/permissions/PrivacyPermission;->type:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v0, v1}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 89
    :goto_10
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public getGroupingDescription()Ljava/lang/String;
    .registers 3

    .prologue
    .line 73
    invoke-static {}, Lcom/rx201/apkmon/permissions/PrivacyPermission;->$SWITCH_TABLE$com$rx201$apkmon$permissions$PrivacyPermission$PRIVACY_TYPE()[I

    move-result-object v0

    iget-object v1, p0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->type:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v1}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_20

    .line 81
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->type:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->name()Ljava/lang/String;

    move-result-object v0

    :goto_15
    return-object v0

    .line 75
    :pswitch_16
    const-string v0, "Contact List"

    goto :goto_15

    .line 77
    :pswitch_19
    const-string v0, "GPS: Last Position"

    goto :goto_15

    .line 79
    :pswitch_1c
    const-string v0, "GPS: Proximity Alert"

    goto :goto_15

    .line 73
    nop

    :pswitch_data_20
    .packed-switch 0x4
        :pswitch_16
        :pswitch_19
        :pswitch_1c
    .end packed-switch
.end method

.method public getGroupingIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->type:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPermissionIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    const-string v0, "privacy"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 15
    invoke-super {p0, p1, p2}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->writeToParcel(Landroid/os/Parcel;I)V

    .line 16
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/PrivacyPermission;->type:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-virtual {v0}, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 17
    return-void
.end method
