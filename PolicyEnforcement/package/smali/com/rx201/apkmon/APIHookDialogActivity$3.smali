.class Lcom/rx201/apkmon/APIHookDialogActivity$3;
.super Ljava/lang/Object;
.source "APIHookDialogActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


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
    iput-object p1, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 140
    iget-object v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    # getter for: Lcom/rx201/apkmon/APIHookDialogActivity;->dlg:Landroid/app/AlertDialog;
    invoke-static {v3}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$2(Lcom/rx201/apkmon/APIHookDialogActivity;)Landroid/app/AlertDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_3b

    iget-object v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    # getter for: Lcom/rx201/apkmon/APIHookDialogActivity;->CountdownStopped:Z
    invoke-static {v3}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$3(Lcom/rx201/apkmon/APIHookDialogActivity;)Z

    move-result v3

    if-nez v3, :cond_3b

    .line 142
    iget-object v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    # getter for: Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;
    invoke-static {v3}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$1(Lcom/rx201/apkmon/APIHookDialogActivity;)Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    move-result-object v3

    invoke-virtual {v3}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getDefaultDelay()I

    move-result v2

    .line 143
    .local v2, "remainingCountdown":I
    if-gt v2, v4, :cond_3c

    .line 146
    iget-object v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    iget-object v4, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    # getter for: Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;
    invoke-static {v4}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$1(Lcom/rx201/apkmon/APIHookDialogActivity;)Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    move-result-object v4

    invoke-virtual {v4}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getDefaultChoice()I

    move-result v4

    # invokes: Lcom/rx201/apkmon/APIHookDialogActivity;->CompleteCurrentUserRequest(I)V
    invoke-static {v3, v4}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$4(Lcom/rx201/apkmon/APIHookDialogActivity;I)V

    .line 147
    iget-object v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    invoke-virtual {v3, v6}, Lcom/rx201/apkmon/APIHookDialogActivity;->dismissDialog(I)V

    .line 148
    iget-object v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    # invokes: Lcom/rx201/apkmon/APIHookDialogActivity;->ProcessingPendingDialogRequests()V
    invoke-static {v3}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$5(Lcom/rx201/apkmon/APIHookDialogActivity;)V

    .line 169
    .end local v2    # "remainingCountdown":I
    :cond_3b
    :goto_3b
    return-void

    .line 152
    .restart local v2    # "remainingCountdown":I
    :cond_3c
    add-int/lit8 v2, v2, -0x1

    .line 155
    iget-object v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    # getter for: Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;
    invoke-static {v3}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$1(Lcom/rx201/apkmon/APIHookDialogActivity;)Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    move-result-object v3

    invoke-virtual {v3}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getDefaultChoice()I

    move-result v3

    if-lez v3, :cond_72

    .line 157
    const/4 v0, -0x1

    .line 158
    .local v0, "BtnID":I
    const-string v3, "Yes (%d)"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, "BtnText":Ljava/lang/String;
    :goto_59
    iget-object v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    # getter for: Lcom/rx201/apkmon/APIHookDialogActivity;->dlg:Landroid/app/AlertDialog;
    invoke-static {v3}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$2(Lcom/rx201/apkmon/APIHookDialogActivity;)Landroid/app/AlertDialog;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 166
    iget-object v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity$3;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    # getter for: Lcom/rx201/apkmon/APIHookDialogActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v3}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$6(Lcom/rx201/apkmon/APIHookDialogActivity;)Landroid/os/Handler;

    move-result-object v3

    const-wide/16 v4, 0x3e8

    invoke-virtual {v3, p0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_3b

    .line 162
    .end local v0    # "BtnID":I
    .end local v1    # "BtnText":Ljava/lang/String;
    :cond_72
    const/4 v0, -0x3

    .line 163
    .restart local v0    # "BtnID":I
    const-string v3, "No (%d)"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "BtnText":Ljava/lang/String;
    goto :goto_59
.end method
