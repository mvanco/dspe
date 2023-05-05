.class public Lcom/rx201/apkmon/permissions/SMSPermission;
.super Lcom/rx201/apkmon/permissions/AurasiumPermission;
.source "SMSPermission.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/rx201/apkmon/permissions/SMSPermission;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private telNum:Ljava/lang/String;

.field private textContent:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    new-instance v0, Lcom/rx201/apkmon/permissions/SMSPermission$1;

    invoke-direct {v0}, Lcom/rx201/apkmon/permissions/SMSPermission$1;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/permissions/SMSPermission;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 57
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

    iput-object v0, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->telNum:Ljava/lang/String;

    .line 21
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->textContent:Ljava/lang/String;

    .line 22
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/rx201/apkmon/permissions/SMSPermission;)V
    .registers 3

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/rx201/apkmon/permissions/SMSPermission;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "SMSNumber"    # Ljava/lang/String;
    .param p2, "SMSContent"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-static {p1, p2}, Lcom/rx201/apkmon/permissions/SMSPermission;->generateDescription(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;-><init>(Ljava/lang/String;)V

    .line 45
    iput-object p1, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->telNum:Ljava/lang/String;

    .line 46
    iput-object p2, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->textContent:Ljava/lang/String;

    .line 47
    return-void
.end method

.method private static ShortenText(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "Text"    # Ljava/lang/String;

    .prologue
    .line 26
    if-nez p0, :cond_4

    .line 27
    const/4 p0, 0x0

    .line 31
    .end local p0    # "Text":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 28
    .restart local p0    # "Text":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xa

    if-le v0, v1, :cond_3

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    const/4 v2, 0x7

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method private static generateDescription(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "SMSNumber"    # Ljava/lang/String;
    .param p1, "SMSContent"    # Ljava/lang/String;

    .prologue
    .line 36
    const-string v0, ""

    .line 37
    .local v0, "PremiumTip":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x6

    if-gt v1, v2, :cond_b

    .line 38
    const-string v0, ", which may be a premium rate number"

    .line 39
    :cond_b
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "This application is trying to send a SMS(\'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/rx201/apkmon/permissions/SMSPermission;->ShortenText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\') to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", allow or not?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 73
    if-eqz p1, :cond_1f

    instance-of v2, p1, Lcom/rx201/apkmon/permissions/SMSPermission;

    if-eqz v2, :cond_1f

    move-object v0, p1

    .line 75
    check-cast v0, Lcom/rx201/apkmon/permissions/SMSPermission;

    .line 76
    .local v0, "p":Lcom/rx201/apkmon/permissions/SMSPermission;
    iget-object v2, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->telNum:Ljava/lang/String;

    iget-object v3, v0, Lcom/rx201/apkmon/permissions/SMSPermission;->telNum:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    iget-object v2, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->textContent:Ljava/lang/String;

    iget-object v3, v0, Lcom/rx201/apkmon/permissions/SMSPermission;->textContent:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    const/4 v1, 0x1

    .line 79
    .end local v0    # "p":Lcom/rx201/apkmon/permissions/SMSPermission;
    :cond_1f
    return v1
.end method

.method public getGroupingDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->telNum:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupingIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->telNum:Ljava/lang/String;

    return-object v0
.end method

.method public getPermissionIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    const-string v0, "SMS"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 14
    invoke-super {p0, p1, p2}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->writeToParcel(Landroid/os/Parcel;I)V

    .line 15
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->telNum:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 16
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/SMSPermission;->textContent:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 17
    return-void
.end method
