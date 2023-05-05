.class Lcom/rx201/apkmon/QueryContentProviderHandler;
.super Lcom/rx201/apkmon/TransactionHandler;
.source "APIHook.java"


# static fields
.field private static final ContactURL:Ljava/lang/String;


# instance fields
.field private callingPkg:Ljava/lang/String;

.field private intercept:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 328
    sget-object v0, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/QueryContentProviderHandler;->ContactURL:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 327
    invoke-direct {p0}, Lcom/rx201/apkmon/TransactionHandler;-><init>()V

    .line 329
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rx201/apkmon/QueryContentProviderHandler;->callingPkg:Ljava/lang/String;

    .line 330
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rx201/apkmon/QueryContentProviderHandler;->intercept:Z

    .line 327
    return-void
.end method


# virtual methods
.method public HandleAfterTransact(Landroid/os/Parcel;)[B
    .registers 6
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 347
    iget-boolean v2, p0, Lcom/rx201/apkmon/QueryContentProviderHandler;->intercept:Z

    if-eqz v2, :cond_22

    .line 349
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 350
    .local v0, "p":Landroid/os/Parcel;
    invoke-virtual {v0}, Landroid/os/Parcel;->writeNoException()V

    .line 351
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x12

    if-lt v2, v3, :cond_16

    .line 352
    iget-object v2, p0, Lcom/rx201/apkmon/QueryContentProviderHandler;->callingPkg:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 355
    :cond_16
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 356
    invoke-virtual {v0}, Landroid/os/Parcel;->marshall()[B

    move-result-object v1

    .line 357
    .local v1, "result":[B
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 362
    .end local v0    # "p":Landroid/os/Parcel;
    .end local v1    # "result":[B
    :goto_21
    return-object v1

    :cond_22
    invoke-super {p0, p1}, Lcom/rx201/apkmon/TransactionHandler;->HandleAfterTransact(Landroid/os/Parcel;)[B

    move-result-object v1

    goto :goto_21
.end method

.method public HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B
    .registers 8
    .param p1, "Descriptor"    # Ljava/lang/String;
    .param p2, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 333
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x12

    if-lt v2, v3, :cond_c

    .line 334
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/rx201/apkmon/QueryContentProviderHandler;->callingPkg:Ljava/lang/String;

    .line 336
    :cond_c
    sget-object v2, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v2, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    .line 337
    .local v0, "url":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    .line 338
    .local v1, "url_string":Ljava/lang/String;
    const-string v2, "APIHook"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Query Content Provider: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/rx201/apkmon/APIHook;->LOG_I(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    sget-object v2, Lcom/rx201/apkmon/QueryContentProviderHandler;->ContactURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_44

    .line 340
    new-instance v2, Lcom/rx201/apkmon/permissions/PrivacyPermission;

    sget-object v3, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->Contact:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-direct {v2, v3}, Lcom/rx201/apkmon/permissions/PrivacyPermission;-><init>(Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;)V

    invoke-static {v2}, Lcom/rx201/apkmon/Utility;->PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z

    move-result v2

    if-nez v2, :cond_44

    .line 341
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/rx201/apkmon/QueryContentProviderHandler;->intercept:Z

    .line 342
    :cond_44
    invoke-super {p0, p1, p2}, Lcom/rx201/apkmon/TransactionHandler;->HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B

    move-result-object v2

    return-object v2
.end method
