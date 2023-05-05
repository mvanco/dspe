.class Lcom/rx201/apkmon/SMSSendTextHandler;
.super Lcom/rx201/apkmon/TransactionHandler;
.source "APIHook.java"


# static fields
.field private static mHasPackageArgument:Z


# instance fields
.field private intercepted:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 185
    sput-boolean v1, Lcom/rx201/apkmon/SMSSendTextHandler;->mHasPackageArgument:Z

    .line 187
    :try_start_3
    const-string v1, "com.android.internal.telephony.ISms"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 188
    .local v0, "iSmsCls":Ljava/lang/Class;
    const-string v1, "sendText"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    .line 189
    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-class v4, Landroid/app/PendingIntent;

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-class v4, Landroid/app/PendingIntent;

    aput-object v4, v2, v3

    .line 188
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 190
    const/4 v1, 0x1

    sput-boolean v1, Lcom/rx201/apkmon/SMSSendTextHandler;->mHasPackageArgument:Z
    :try_end_32
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_32} :catch_35
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_32} :catch_33

    .line 194
    :goto_32
    return-void

    .line 192
    :catch_33
    move-exception v1

    goto :goto_32

    .line 191
    :catch_35
    move-exception v1

    goto :goto_32
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 181
    invoke-direct {p0}, Lcom/rx201/apkmon/TransactionHandler;-><init>()V

    .line 195
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rx201/apkmon/SMSSendTextHandler;->intercepted:Z

    .line 181
    return-void
.end method


# virtual methods
.method public HandleAfterTransact(Landroid/os/Parcel;)[B
    .registers 6
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 229
    iget-boolean v3, p0, Lcom/rx201/apkmon/SMSSendTextHandler;->intercepted:Z

    if-eqz v3, :cond_7

    .line 232
    :try_start_4
    invoke-virtual {p1}, Landroid/os/Parcel;->readException()V
    :try_end_7
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_7} :catch_9

    .line 244
    :cond_7
    const/4 v2, 0x0

    :goto_8
    return-object v2

    .line 233
    :catch_9
    move-exception v0

    .line 237
    .local v0, "e":Ljava/lang/NullPointerException;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 238
    .local v1, "p":Landroid/os/Parcel;
    invoke-virtual {v1}, Landroid/os/Parcel;->writeNoException()V

    .line 239
    invoke-virtual {v1}, Landroid/os/Parcel;->marshall()[B

    move-result-object v2

    .line 240
    .local v2, "result":[B
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    goto :goto_8
.end method

.method public HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B
    .registers 15
    .param p1, "Descriptor"    # Ljava/lang/String;
    .param p2, "parcel"    # Landroid/os/Parcel;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 198
    const/4 v0, 0x0

    .line 199
    .local v0, "callingPkg":Ljava/lang/String;
    sget-boolean v6, Lcom/rx201/apkmon/SMSSendTextHandler;->mHasPackageArgument:Z

    if-eqz v6, :cond_b

    .line 200
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 201
    :cond_b
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 202
    .local v1, "destAddr":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 203
    .local v4, "scAddr":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    .line 204
    .local v5, "text":Ljava/lang/String;
    const-string v6, "HandleBeforeTransact"

    const-string v7, "SendText: dest:%s, src:%s, text:%s"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v1, v8, v10

    aput-object v4, v8, v11

    const/4 v9, 0x2

    aput-object v5, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/rx201/apkmon/APIHook;->LOG_I(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    new-instance v6, Lcom/rx201/apkmon/permissions/SMSPermission;

    invoke-direct {v6, v1, v5}, Lcom/rx201/apkmon/permissions/SMSPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v6}, Lcom/rx201/apkmon/Utility;->PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z

    move-result v6

    if-nez v6, :cond_6c

    .line 207
    iput-boolean v11, p0, Lcom/rx201/apkmon/SMSSendTextHandler;->intercepted:Z

    .line 209
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 210
    .local v2, "newparcel":Landroid/os/Parcel;
    sget-boolean v6, Lcom/rx201/apkmon/SMSSendTextHandler;->mHasPackageArgument:Z

    if-eqz v6, :cond_44

    .line 211
    invoke-virtual {v2, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 212
    :cond_44
    const-string v6, ""

    invoke-virtual {v2, v6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 213
    invoke-virtual {v2, v4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 214
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "BLOCKED:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 216
    invoke-virtual {v2, v10}, Landroid/os/Parcel;->writeInt(I)V

    .line 218
    invoke-virtual {v2, v10}, Landroid/os/Parcel;->writeInt(I)V

    .line 220
    invoke-virtual {v2}, Landroid/os/Parcel;->marshall()[B

    move-result-object v3

    .line 221
    .local v3, "result":[B
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 225
    .end local v2    # "newparcel":Landroid/os/Parcel;
    .end local v3    # "result":[B
    :goto_6b
    return-object v3

    :cond_6c
    const/4 v3, 0x0

    goto :goto_6b
.end method
