.class public interface abstract Lcom/rx201/apkmon/demo/IAddResultCallback;
.super Ljava/lang/Object;
.source "IAddResultCallback.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rx201/apkmon/demo/IAddResultCallback$Stub;
    }
.end annotation


# virtual methods
.method public abstract onResult(II)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
