.class Lcom/rx201/apkmon/TransactionHandler;
.super Ljava/lang/Object;
.source "APIHook.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public HandleAfterTransact(Landroid/os/Parcel;)[B
    .registers 3
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 178
    const/4 v0, 0x0

    return-object v0
.end method

.method public HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B
    .registers 4
    .param p1, "Descriptor"    # Ljava/lang/String;
    .param p2, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 168
    const/4 v0, 0x0

    return-object v0
.end method
