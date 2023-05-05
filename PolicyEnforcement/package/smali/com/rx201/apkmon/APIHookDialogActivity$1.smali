.class Lcom/rx201/apkmon/APIHookDialogActivity$1;
.super Ljava/lang/Object;
.source "APIHookDialogActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rx201/apkmon/APIHookDialogActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rx201/apkmon/APIHookDialogActivity;


# direct methods
.method constructor <init>(Lcom/rx201/apkmon/APIHookDialogActivity;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/rx201/apkmon/APIHookDialogActivity$1;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 4
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 67
    iget-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity$1;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    invoke-static {v0, p2}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$0(Lcom/rx201/apkmon/APIHookDialogActivity;Z)V

    .line 68
    return-void
.end method
