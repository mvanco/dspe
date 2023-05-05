.class Lcom/rx201/apkmon/TransactionInfo;
.super Ljava/lang/Object;
.source "APIHook.java"


# instance fields
.field public Code:I

.field public Descriptor:Ljava/lang/String;

.field public Handler:Lcom/rx201/apkmon/TransactionHandler;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILcom/rx201/apkmon/TransactionHandler;)V
    .registers 4
    .param p1, "descriptor"    # Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "handler"    # Lcom/rx201/apkmon/TransactionHandler;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/rx201/apkmon/TransactionInfo;->Descriptor:Ljava/lang/String;

    .line 63
    iput p2, p0, Lcom/rx201/apkmon/TransactionInfo;->Code:I

    .line 64
    iput-object p3, p0, Lcom/rx201/apkmon/TransactionInfo;->Handler:Lcom/rx201/apkmon/TransactionHandler;

    .line 65
    return-void
.end method
