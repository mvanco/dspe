.class Lcom/rx201/apkmon/GetLineNumberHandler;
.super Lcom/rx201/apkmon/TransactionHandler;
.source "APIHook.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 267
    invoke-direct {p0}, Lcom/rx201/apkmon/TransactionHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public HandleAfterTransact(Landroid/os/Parcel;)[B
    .registers 7
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    const/4 v2, 0x0

    .line 271
    new-instance v3, Lcom/rx201/apkmon/permissions/PrivacyPermission;

    sget-object v4, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->PhoneNumber:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-direct {v3, v4}, Lcom/rx201/apkmon/permissions/PrivacyPermission;-><init>(Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;)V

    invoke-static {v3}, Lcom/rx201/apkmon/Utility;->PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z

    move-result v3

    if-nez v3, :cond_21

    .line 274
    :try_start_e
    invoke-virtual {p1}, Landroid/os/Parcel;->readException()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_11} :catch_22

    .line 279
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 280
    .local v1, "newp":Landroid/os/Parcel;
    invoke-virtual {v1}, Landroid/os/Parcel;->writeNoException()V

    .line 281
    const-string v2, "07712345678"

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 282
    invoke-virtual {v1}, Landroid/os/Parcel;->marshall()[B

    move-result-object v2

    .line 284
    .end local v1    # "newp":Landroid/os/Parcel;
    :cond_21
    :goto_21
    return-object v2

    .line 275
    :catch_22
    move-exception v0

    .line 277
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_21
.end method
