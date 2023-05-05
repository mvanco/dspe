.class public Lcom/rx201/apkmon/permissions/PermissionRequestIntent;
.super Landroid/content/Intent;
.source "PermissionRequestIntent.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/rx201/apkmon/permissions/PermissionRequestIntent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    new-instance v0, Lcom/rx201/apkmon/permissions/PermissionRequestIntent$1;

    invoke-direct {v0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent$1;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;)V
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 15
    invoke-virtual {p0, p1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->readFromParcel(Landroid/os/Parcel;)V

    .line 16
    return-void
.end method


# virtual methods
.method public getApplicationPackage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 47
    const-string v0, "Application"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultChoice()I
    .registers 3

    .prologue
    .line 77
    const-string v0, "DefaultChoice"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getDefaultDelay()I
    .registers 3

    .prologue
    .line 71
    const-string v0, "DefaultDelay"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getGroupingDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getPermissionRequest()Lcom/rx201/apkmon/permissions/AurasiumPermission;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->getGroupingDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPermissionRequest()Lcom/rx201/apkmon/permissions/AurasiumPermission;
    .registers 2

    .prologue
    .line 56
    const-string v0, "PermissionRequest"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/rx201/apkmon/permissions/AurasiumPermission;

    return-object v0
.end method

.method public getPromptText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getPermissionRequest()Lcom/rx201/apkmon/permissions/AurasiumPermission;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->getDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteIP()Ljava/lang/String;
    .registers 3

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getPermissionRequest()Lcom/rx201/apkmon/permissions/AurasiumPermission;

    move-result-object v0

    .line 84
    .local v0, "p":Lcom/rx201/apkmon/permissions/AurasiumPermission;
    instance-of v1, v0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;

    if-eqz v1, :cond_d

    .line 85
    check-cast v0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;

    .end local v0    # "p":Lcom/rx201/apkmon/permissions/AurasiumPermission;
    iget-object v1, v0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteIP:Ljava/lang/String;

    .line 87
    :goto_c
    return-object v1

    .restart local v0    # "p":Lcom/rx201/apkmon/permissions/AurasiumPermission;
    :cond_d
    const/4 v1, 0x0

    goto :goto_c
.end method

.method public getResponseToken()I
    .registers 3

    .prologue
    .line 41
    const-string v0, "ResponseToken"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getResultMessenger()Landroid/os/Messenger;
    .registers 2

    .prologue
    .line 65
    const-string v0, "ResultCallback"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/Messenger;

    return-object v0
.end method

.method public setApplicationPackage(Ljava/lang/String;)V
    .registers 3
    .param p1, "app"    # Ljava/lang/String;

    .prologue
    .line 50
    const-string v0, "Application"

    invoke-virtual {p0, v0, p1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 51
    return-void
.end method

.method public setDefaultChoice(I)V
    .registers 3
    .param p1, "choice"    # I

    .prologue
    .line 80
    const-string v0, "DefaultChoice"

    invoke-virtual {p0, v0, p1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 81
    return-void
.end method

.method public setDefaultDelay(I)V
    .registers 3
    .param p1, "delay"    # I

    .prologue
    .line 74
    const-string v0, "DefaultDelay"

    invoke-virtual {p0, v0, p1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 75
    return-void
.end method

.method public setPermissionRequest(Lcom/rx201/apkmon/permissions/AurasiumPermission;)V
    .registers 3
    .param p1, "permission"    # Lcom/rx201/apkmon/permissions/AurasiumPermission;

    .prologue
    .line 53
    const-string v0, "PermissionRequest"

    invoke-virtual {p0, v0, p1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 54
    return-void
.end method

.method public setResponseToken(I)V
    .registers 3
    .param p1, "token"    # I

    .prologue
    .line 44
    const-string v0, "ResponseToken"

    invoke-virtual {p0, v0, p1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 45
    return-void
.end method

.method public setResultMessenger(Landroid/os/Messenger;)V
    .registers 3
    .param p1, "messenger"    # Landroid/os/Messenger;

    .prologue
    .line 68
    const-string v0, "ResultCallback"

    invoke-virtual {p0, v0, p1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 69
    return-void
.end method

.method public validate()Z
    .registers 2

    .prologue
    .line 29
    const-string v0, "Application"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    const-string v0, "ResponseToken"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    const-string v0, "PermissionRequest"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    const-string v0, "ResultCallback"

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 11
    invoke-super {p0, p1, p2}, Landroid/content/Intent;->writeToParcel(Landroid/os/Parcel;I)V

    .line 12
    return-void
.end method
