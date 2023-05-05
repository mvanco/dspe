.class public interface abstract Lcom/rx201/apkmon/demo/IMyService;
.super Ljava/lang/Object;
.source "IMyService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rx201/apkmon/demo/IMyService$Stub;
    }
.end annotation


# virtual methods
.method public abstract add(IILcom/rx201/apkmon/demo/IAddResultCallback;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
