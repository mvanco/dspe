.class public abstract Lcom/rx201/apkmon/demo/IMyService$Stub;
.super Landroid/os/Binder;
.source "IMyService.java"

# interfaces
.implements Lcom/rx201/apkmon/demo/IMyService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rx201/apkmon/demo/IMyService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rx201/apkmon/demo/IMyService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.rx201.apkmon.demo.IMyService"

.field static final TRANSACTION_add:I = 0x1


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 17
    const-string v0, "com.rx201.apkmon.demo.IMyService"

    invoke-virtual {p0, p0, v0}, Lcom/rx201/apkmon/demo/IMyService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/rx201/apkmon/demo/IMyService;
    .registers 3
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    .line 25
    if-nez p0, :cond_4

    .line 26
    const/4 v0, 0x0

    .line 32
    :goto_3
    return-object v0

    .line 28
    :cond_4
    const-string v1, "com.rx201.apkmon.demo.IMyService"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 29
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_13

    instance-of v1, v0, Lcom/rx201/apkmon/demo/IMyService;

    if-eqz v1, :cond_13

    .line 30
    check-cast v0, Lcom/rx201/apkmon/demo/IMyService;

    goto :goto_3

    .line 32
    :cond_13
    new-instance v0, Lcom/rx201/apkmon/demo/IMyService$Stub$Proxy;

    .end local v0    # "iin":Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/rx201/apkmon/demo/IMyService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_3
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    .prologue
    .line 36
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 11
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 40
    sparse-switch p1, :sswitch_data_30

    .line 62
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v4

    :goto_8
    return v4

    .line 44
    :sswitch_9
    const-string v5, "com.rx201.apkmon.demo.IMyService"

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_8

    .line 49
    :sswitch_f
    const-string v5, "com.rx201.apkmon.demo.IMyService"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 51
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 53
    .local v0, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 55
    .local v1, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v5

    invoke-static {v5}, Lcom/rx201/apkmon/demo/IAddResultCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/rx201/apkmon/demo/IAddResultCallback;

    move-result-object v2

    .line 56
    .local v2, "_arg2":Lcom/rx201/apkmon/demo/IAddResultCallback;
    invoke-virtual {p0, v0, v1, v2}, Lcom/rx201/apkmon/demo/IMyService$Stub;->add(IILcom/rx201/apkmon/demo/IAddResultCallback;)I

    move-result v3

    .line 57
    .local v3, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 58
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_8

    .line 40
    nop

    :sswitch_data_30
    .sparse-switch
        0x1 -> :sswitch_f
        0x5f4e5446 -> :sswitch_9
    .end sparse-switch
.end method
