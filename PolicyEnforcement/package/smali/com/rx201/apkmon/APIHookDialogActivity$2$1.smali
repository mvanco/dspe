.class Lcom/rx201/apkmon/APIHookDialogActivity$2$1;
.super Ljava/lang/Object;
.source "APIHookDialogActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rx201/apkmon/APIHookDialogActivity$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/rx201/apkmon/APIHookDialogActivity$2;

.field private final synthetic val$IpDesc:Ljava/lang/String;

.field private final synthetic val$tvIpInfo:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/rx201/apkmon/APIHookDialogActivity$2;Landroid/widget/TextView;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 1
    iput-object p1, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2$1;->this$1:Lcom/rx201/apkmon/APIHookDialogActivity$2;

    iput-object p2, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2$1;->val$tvIpInfo:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2$1;->val$IpDesc:Ljava/lang/String;

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 112
    iget-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2$1;->val$tvIpInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2$1;->val$IpDesc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    return-void
.end method
