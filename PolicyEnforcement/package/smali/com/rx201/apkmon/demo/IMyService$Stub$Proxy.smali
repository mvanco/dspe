.class Lcom/rx201/apkmon/demo/IMyService$Stub$Proxy;
.super Ljava/lang/Object;
.source "IMyService.java"

# interfaces
.implements Lcom/rx201/apkmon/demo/IMyService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rx201/apkmon/demo/IMyService$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .registers 2
    .param p1, "remote"    # Landroid/os/IBinder;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/rx201/apkmon/demo/IMyService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    .line 70
    return-void
.end method


# virtual methods
.method public add(IILcom/rx201/apkmon/demo/IAddResultCallback;)I
    .registers 10
    .param p1, "i1"    # I
    .param p2, "i2"    # I
    .param p3, "ResultCallback"    # Lcom/rx201/apkmon/demo/IAddResultCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 82
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 85
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.rx201.apkmon.demo.IMyService"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 86
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 87
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 88
    if-eqz p3, :cond_31

    invoke-interface {p3}, Lcom/rx201/apkmon/demo/IAddResultCallback;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    :goto_19
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 89
    iget-object v3, p0, Lcom/rx201/apkmon/demo/IMyService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 90
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 91
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_29
    .catchall {:try_start_8 .. :try_end_29} :catchall_33

    move-result v2

    .line 94
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 95
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 97
    return v2

    .line 88
    .end local v2    # "_result":I
    :cond_31
    const/4 v3, 0x0

    goto :goto_19

    .line 93
    :catchall_33
    move-exception v3

    .line 94
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 95
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 96
    throw v3
.end method

.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/rx201/apkmon/demo/IMyService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 77
    const-string v0, "com.rx201.apkmon.demo.IMyService"

    return-object v0
.end method
