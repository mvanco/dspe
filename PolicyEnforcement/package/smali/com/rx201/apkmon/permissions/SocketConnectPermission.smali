.class public Lcom/rx201/apkmon/permissions/SocketConnectPermission;
.super Lcom/rx201/apkmon/permissions/AurasiumPermission;
.source "SocketConnectPermission.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/rx201/apkmon/permissions/SocketConnectPermission;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private remoteDomain:Ljava/lang/String;

.field public remoteIP:Ljava/lang/String;

.field private remotePort:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 45
    new-instance v0, Lcom/rx201/apkmon/permissions/SocketConnectPermission$1;

    invoke-direct {v0}, Lcom/rx201/apkmon/permissions/SocketConnectPermission$1;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 53
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/rx201/apkmon/permissions/AurasiumPermission;-><init>(Landroid/os/Parcel;)V

    .line 26
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteIP:Ljava/lang/String;

    .line 27
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteDomain:Ljava/lang/String;

    .line 28
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remotePort:I

    .line 29
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/rx201/apkmon/permissions/SocketConnectPermission;)V
    .registers 3

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/rx201/apkmon/permissions/SocketConnectPermission;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 8
    .param p1, "RemoteIP"    # Ljava/lang/String;
    .param p2, "DomainName"    # Ljava/lang/String;
    .param p3, "PortNum"    # I

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteIP:Ljava/lang/String;

    .line 36
    if-eqz p2, :cond_26

    .line 37
    iput-object p2, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteDomain:Ljava/lang/String;

    .line 40
    :goto_9
    iput p3, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remotePort:I

    .line 42
    const-string v0, "This application is connecting to remote server: %s:%d, allow or not?"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteDomain:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remotePort:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->setDescription(Ljava/lang/String;)V

    .line 43
    return-void

    .line 39
    :cond_26
    iput-object p1, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteDomain:Ljava/lang/String;

    goto :goto_9
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 69
    if-eqz p1, :cond_25

    instance-of v2, p1, Lcom/rx201/apkmon/permissions/SocketConnectPermission;

    if-eqz v2, :cond_25

    move-object v0, p1

    .line 71
    check-cast v0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;

    .line 72
    .local v0, "p":Lcom/rx201/apkmon/permissions/SocketConnectPermission;
    iget-object v2, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteIP:Ljava/lang/String;

    iget-object v3, v0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteIP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    iget-object v2, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteDomain:Ljava/lang/String;

    iget-object v3, v0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteDomain:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    iget v2, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remotePort:I

    iget v3, v0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remotePort:I

    if-ne v2, v3, :cond_25

    const/4 v1, 0x1

    .line 75
    .end local v0    # "p":Lcom/rx201/apkmon/permissions/SocketConnectPermission;
    :cond_25
    return v1
.end method

.method public getGroupingDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteDomain:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupingIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteDomain:Ljava/lang/String;

    return-object v0
.end method

.method public getPermissionIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    const-string v0, "connect"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 19
    invoke-super {p0, p1, p2}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->writeToParcel(Landroid/os/Parcel;I)V

    .line 20
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteIP:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 21
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remoteDomain:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 22
    iget v0, p0, Lcom/rx201/apkmon/permissions/SocketConnectPermission;->remotePort:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 23
    return-void
.end method
