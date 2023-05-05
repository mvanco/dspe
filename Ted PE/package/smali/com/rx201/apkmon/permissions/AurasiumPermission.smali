.class public abstract Lcom/rx201/apkmon/permissions/AurasiumPermission;
.super Ljava/lang/Object;
.source "AurasiumPermission.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/io/Serializable;


# instance fields
.field private description:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rx201/apkmon/permissions/AurasiumPermission;->description:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "Description"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-virtual {p0, p1}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->setDescription(Ljava/lang/String;)V

    .line 35
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 19
    const/4 v0, 0x0

    return v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 14
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/AurasiumPermission;->description:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getGroupingDescription()Ljava/lang/String;
.end method

.method public abstract getGroupingIdentifier()Ljava/lang/String;
.end method

.method public abstract getPermissionIdentifier()Ljava/lang/String;
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "Description"    # Ljava/lang/String;

    .prologue
    .line 11
    iput-object p1, p0, Lcom/rx201/apkmon/permissions/AurasiumPermission;->description:Ljava/lang/String;

    .line 12
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 24
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/AurasiumPermission;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 25
    return-void
.end method
