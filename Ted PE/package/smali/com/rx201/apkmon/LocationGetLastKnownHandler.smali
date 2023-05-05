.class Lcom/rx201/apkmon/LocationGetLastKnownHandler;
.super Lcom/rx201/apkmon/TransactionHandler;
.source "APIHook.java"


# instance fields
.field private intercept:Z


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 367
    invoke-direct {p0}, Lcom/rx201/apkmon/TransactionHandler;-><init>()V

    .line 369
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rx201/apkmon/LocationGetLastKnownHandler;->intercept:Z

    .line 367
    return-void
.end method


# virtual methods
.method public HandleAfterTransact(Landroid/os/Parcel;)[B
    .registers 5
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 380
    iget-boolean v2, p0, Lcom/rx201/apkmon/LocationGetLastKnownHandler;->intercept:Z

    if-eqz v2, :cond_17

    .line 382
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 383
    .local v0, "p":Landroid/os/Parcel;
    invoke-virtual {v0}, Landroid/os/Parcel;->writeNoException()V

    .line 384
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 385
    invoke-virtual {v0}, Landroid/os/Parcel;->marshall()[B

    move-result-object v1

    .line 386
    .local v1, "result":[B
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 389
    .end local v0    # "p":Landroid/os/Parcel;
    .end local v1    # "result":[B
    :goto_16
    return-object v1

    :cond_17
    const/4 v1, 0x0

    goto :goto_16
.end method

.method public HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B
    .registers 5
    .param p1, "Descriptor"    # Ljava/lang/String;
    .param p2, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 372
    new-instance v0, Lcom/rx201/apkmon/permissions/PrivacyPermission;

    sget-object v1, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->GPS_Last:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-direct {v0, v1}, Lcom/rx201/apkmon/permissions/PrivacyPermission;-><init>(Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;)V

    invoke-static {v0}, Lcom/rx201/apkmon/Utility;->PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 373
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rx201/apkmon/LocationGetLastKnownHandler;->intercept:Z

    .line 376
    :goto_10
    const/4 v0, 0x0

    return-object v0

    .line 375
    :cond_12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rx201/apkmon/LocationGetLastKnownHandler;->intercept:Z

    goto :goto_10
.end method
