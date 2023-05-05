.class public Lcom/rx201/apkmon/permissions/NativeLibraryPermission;
.super Lcom/rx201/apkmon/permissions/AurasiumPermission;
.source "NativeLibraryPermission.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/rx201/apkmon/permissions/NativeLibraryPermission;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private libraryPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    new-instance v0, Lcom/rx201/apkmon/permissions/NativeLibraryPermission$1;

    invoke-direct {v0}, Lcom/rx201/apkmon/permissions/NativeLibraryPermission$1;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 37
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/rx201/apkmon/permissions/AurasiumPermission;-><init>(Landroid/os/Parcel;)V

    .line 18
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;->libraryPath:Ljava/lang/String;

    .line 19
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/rx201/apkmon/permissions/NativeLibraryPermission;)V
    .registers 3

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "Library"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;->libraryPath:Ljava/lang/String;

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "This application may be trying to increase its control over your phone by loading native library "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", allow or not?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;->setDescription(Ljava/lang/String;)V

    .line 27
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 54
    if-eqz p1, :cond_11

    instance-of v0, p1, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;

    if-eqz v0, :cond_11

    .line 55
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;->libraryPath:Ljava/lang/String;

    check-cast p1, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;->libraryPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 57
    :goto_10
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public getGroupingDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;->libraryPath:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupingIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;->libraryPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPermissionIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 41
    const-string v0, "dlopen"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 13
    invoke-super {p0, p1, p2}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->writeToParcel(Landroid/os/Parcel;I)V

    .line 14
    iget-object v0, p0, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;->libraryPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 15
    return-void
.end method
