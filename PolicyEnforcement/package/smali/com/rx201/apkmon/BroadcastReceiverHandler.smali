.class Lcom/rx201/apkmon/BroadcastReceiverHandler;
.super Lcom/rx201/apkmon/TransactionHandler;
.source "APIHook.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 248
    invoke-direct {p0}, Lcom/rx201/apkmon/TransactionHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B
    .registers 16
    .param p1, "Descriptor"    # Ljava/lang/String;
    .param p2, "parcel"    # Landroid/os/Parcel;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 253
    sget-object v10, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v10, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Intent;

    .line 254
    .local v3, "intent":Landroid/content/Intent;
    sget-object v10, Landroid/content/pm/ActivityInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v10, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ActivityInfo;

    .line 255
    .local v2, "info":Landroid/content/pm/ActivityInfo;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 256
    .local v4, "resultCode":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    .line 257
    .local v5, "resultData":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v6

    .line 258
    .local v6, "resultExtras":Landroid/os/Bundle;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v10

    if-eqz v10, :cond_45

    move v7, v8

    .line 260
    .local v7, "sync":Z
    :goto_25
    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 261
    .local v0, "IntentAction":Ljava/lang/String;
    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 262
    .local v1, "IntentReceiver":Ljava/lang/String;
    const-string v10, "HandleBeforeTransact"

    const-string v11, "Broadcast Receiver %s %s will be called"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    aput-object v0, v12, v9

    aput-object v1, v12, v8

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Lcom/rx201/apkmon/APIHook;->LOG_I(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    const/4 v8, 0x0

    return-object v8

    .end local v0    # "IntentAction":Ljava/lang/String;
    .end local v1    # "IntentReceiver":Ljava/lang/String;
    .end local v7    # "sync":Z
    :cond_45
    move v7, v9

    .line 258
    goto :goto_25
.end method
