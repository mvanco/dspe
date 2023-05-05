.class public Lcom/rx201/apkmon/APIHookDialogActivity;
.super Landroid/app/Activity;
.source "APIHookDialogActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field private CountdownStopped:Z

.field private CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

.field private RememberDecision:Z

.field private UserRequests:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/rx201/apkmon/permissions/PermissionRequestIntent;",
            ">;"
        }
    .end annotation
.end field

.field private dlg:Landroid/app/AlertDialog;

.field private mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 33
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 35
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->UserRequests:Ljava/util/LinkedList;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    .line 37
    iput-boolean v1, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->RememberDecision:Z

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->mHandler:Landroid/os/Handler;

    .line 44
    iput-boolean v1, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CountdownStopped:Z

    .line 33
    return-void
.end method

.method private CompleteCurrentUserRequest(I)V
    .registers 5
    .param p1, "msgArg1"    # I

    .prologue
    .line 182
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 183
    .local v1, "msg":Landroid/os/Message;
    iget-object v2, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getResponseToken()I

    move-result v2

    iput v2, v1, Landroid/os/Message;->what:I

    .line 184
    iput p1, v1, Landroid/os/Message;->arg1:I

    .line 185
    iget-boolean v2, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->RememberDecision:Z

    if-eqz v2, :cond_22

    const/4 v2, 0x1

    :goto_13
    iput v2, v1, Landroid/os/Message;->arg2:I

    .line 187
    :try_start_15
    iget-object v2, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getResultMessenger()Landroid/os/Messenger;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_1e
    .catch Landroid/os/RemoteException; {:try_start_15 .. :try_end_1e} :catch_24
    .catchall {:try_start_15 .. :try_end_1e} :catchall_2c

    .line 191
    invoke-virtual {v1}, Landroid/os/Message;->recycle()V

    .line 193
    :goto_21
    return-void

    .line 185
    :cond_22
    const/4 v2, 0x0

    goto :goto_13

    .line 188
    :catch_24
    move-exception v0

    .line 189
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_25
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_2c

    .line 191
    invoke-virtual {v1}, Landroid/os/Message;->recycle()V

    goto :goto_21

    .line 190
    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_2c
    move-exception v2

    .line 191
    invoke-virtual {v1}, Landroid/os/Message;->recycle()V

    .line 192
    throw v2
.end method

.method private EnqueueNewIntent(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 177
    new-instance v0, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-direct {v0, p1}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;-><init>(Landroid/content/Intent;)V

    .line 178
    .local v0, "req":Lcom/rx201/apkmon/permissions/PermissionRequestIntent;
    iget-object v1, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->UserRequests:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 179
    return-void
.end method

.method private ProcessingPendingDialogRequests()V
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->UserRequests:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-nez v0, :cond_f

    .line 201
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    .line 202
    invoke-virtual {p0}, Lcom/rx201/apkmon/APIHookDialogActivity;->finish()V

    .line 209
    :goto_e
    return-void

    .line 206
    :cond_f
    iget-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->UserRequests:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    iput-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    .line 207
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rx201/apkmon/APIHookDialogActivity;->showDialog(I)V

    goto :goto_e
.end method

.method static synthetic access$0(Lcom/rx201/apkmon/APIHookDialogActivity;Z)V
    .registers 2

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->RememberDecision:Z

    return-void
.end method

.method static synthetic access$1(Lcom/rx201/apkmon/APIHookDialogActivity;)Lcom/rx201/apkmon/permissions/PermissionRequestIntent;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    return-object v0
.end method

.method static synthetic access$2(Lcom/rx201/apkmon/APIHookDialogActivity;)Landroid/app/AlertDialog;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->dlg:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$3(Lcom/rx201/apkmon/APIHookDialogActivity;)Z
    .registers 2

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CountdownStopped:Z

    return v0
.end method

.method static synthetic access$4(Lcom/rx201/apkmon/APIHookDialogActivity;I)V
    .registers 2

    .prologue
    .line 180
    invoke-direct {p0, p1}, Lcom/rx201/apkmon/APIHookDialogActivity;->CompleteCurrentUserRequest(I)V

    return-void
.end method

.method static synthetic access$5(Lcom/rx201/apkmon/APIHookDialogActivity;)V
    .registers 1

    .prologue
    .line 197
    invoke-direct {p0}, Lcom/rx201/apkmon/APIHookDialogActivity;->ProcessingPendingDialogRequests()V

    return-void
.end method

.method static synthetic access$6(Lcom/rx201/apkmon/APIHookDialogActivity;)Landroid/os/Handler;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 7
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 261
    iget-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    if-nez v0, :cond_8

    .line 274
    :goto_7
    return-void

    .line 263
    :cond_8
    iput-boolean v3, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CountdownStopped:Z

    .line 265
    if-ne p2, v1, :cond_16

    .line 266
    invoke-direct {p0, v3}, Lcom/rx201/apkmon/APIHookDialogActivity;->CompleteCurrentUserRequest(I)V

    .line 272
    :goto_f
    invoke-virtual {p0, v2}, Lcom/rx201/apkmon/APIHookDialogActivity;->dismissDialog(I)V

    .line 273
    invoke-direct {p0}, Lcom/rx201/apkmon/APIHookDialogActivity;->ProcessingPendingDialogRequests()V

    goto :goto_7

    .line 267
    :cond_16
    const/4 v0, -0x3

    if-ne p2, v0, :cond_1d

    .line 268
    invoke-direct {p0, v2}, Lcom/rx201/apkmon/APIHookDialogActivity;->CompleteCurrentUserRequest(I)V

    goto :goto_f

    .line 270
    :cond_1d
    invoke-direct {p0, v1}, Lcom/rx201/apkmon/APIHookDialogActivity;->CompleteCurrentUserRequest(I)V

    goto :goto_f
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 222
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 224
    if-eqz p1, :cond_43

    .line 228
    const-string v1, "RememberDecision"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->RememberDecision:Z

    .line 229
    const-string v1, "CurReq"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    iput-object v1, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    .line 230
    iget-object v1, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->UserRequests:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 231
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    const-string v1, "PendingRequests"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    if-lt v0, v1, :cond_26

    .line 240
    .end local v0    # "i":I
    :goto_25
    return-void

    .line 232
    .restart local v0    # "i":I
    :cond_26
    iget-object v2, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->UserRequests:Ljava/util/LinkedList;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "PendingReq"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 231
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 236
    .end local v0    # "i":I
    :cond_43
    invoke-virtual {p0}, Lcom/rx201/apkmon/APIHookDialogActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/rx201/apkmon/APIHookDialogActivity;->EnqueueNewIntent(Landroid/content/Intent;)V

    .line 237
    invoke-direct {p0}, Lcom/rx201/apkmon/APIHookDialogActivity;->ProcessingPendingDialogRequests()V

    goto :goto_25
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .registers 12
    .param p1, "id"    # I

    .prologue
    const/4 v9, 0x0

    const/4 v8, -0x1

    .line 47
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 48
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v6, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {v6}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getPromptText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 49
    invoke-virtual {v6, v9}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 50
    iget-object v7, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {v7}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getApplicationPackage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 51
    const-string v7, "Yes"

    invoke-virtual {v6, v7, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 52
    const-string v7, "No"

    invoke-virtual {v6, v7, p0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 53
    const-string v7, "Kill App"

    invoke-virtual {v6, v7, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 55
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 56
    .local v3, "linearLayout":Landroid/widget/LinearLayout;
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 57
    invoke-direct {v6, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 56
    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 60
    new-instance v2, Landroid/widget/CheckBox;

    invoke-direct {v2, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 61
    .local v2, "checkBox":Landroid/widget/CheckBox;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Remember this decision for: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {v7}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getGroupingDescription()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 62
    iget-boolean v6, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->RememberDecision:Z

    invoke-virtual {v2, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 63
    new-instance v6, Lcom/rx201/apkmon/APIHookDialogActivity$1;

    invoke-direct {v6, p0}, Lcom/rx201/apkmon/APIHookDialogActivity$1;-><init>(Lcom/rx201/apkmon/APIHookDialogActivity;)V

    invoke-virtual {v2, v6}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 70
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 73
    iget-object v6, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {v6}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getRemoteIP()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_b0

    .line 75
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 76
    .local v4, "tvIpAddr":Landroid/widget/TextView;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "IP Address: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {v7}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getRemoteIP()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 79
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 80
    .local v5, "tvIpInfo":Landroid/widget/TextView;
    const-string v6, "Retrieving information about this address..."

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    new-instance v0, Ljava/lang/Thread;

    new-instance v6, Lcom/rx201/apkmon/APIHookDialogActivity$2;

    invoke-direct {v6, p0, v5}, Lcom/rx201/apkmon/APIHookDialogActivity$2;-><init>(Lcom/rx201/apkmon/APIHookDialogActivity;Landroid/widget/TextView;)V

    invoke-direct {v0, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 126
    .local v0, "IpLookupThread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 127
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 130
    .end local v0    # "IpLookupThread":Ljava/lang/Thread;
    .end local v4    # "tvIpAddr":Landroid/widget/TextView;
    .end local v5    # "tvIpInfo":Landroid/widget/TextView;
    :cond_b0
    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 132
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    iput-object v6, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->dlg:Landroid/app/AlertDialog;

    .line 133
    iget-object v6, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->dlg:Landroid/app/AlertDialog;

    invoke-virtual {v6, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 135
    iget-object v6, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {v6}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getDefaultDelay()I

    move-result v6

    if-eqz v6, :cond_d4

    .line 137
    iput-boolean v9, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CountdownStopped:Z

    .line 138
    iget-object v6, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->mHandler:Landroid/os/Handler;

    new-instance v7, Lcom/rx201/apkmon/APIHookDialogActivity$3;

    invoke-direct {v7, p0}, Lcom/rx201/apkmon/APIHookDialogActivity$3;-><init>(Lcom/rx201/apkmon/APIHookDialogActivity;)V

    .line 170
    const-wide/16 v8, 0x3e8

    .line 138
    invoke-virtual {v6, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 172
    :cond_d4
    iget-object v6, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->dlg:Landroid/app/AlertDialog;

    return-object v6
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 281
    return-void
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 244
    invoke-super {p0, p1}, Landroid/app/Activity;->onPostCreate(Landroid/os/Bundle;)V

    .line 245
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 249
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 251
    const-string v1, "RememberDecision"

    iget-boolean v2, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->RememberDecision:Z

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 252
    const-string v1, "CurReq"

    iget-object v2, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 253
    const-string v1, "PendingRequests"

    iget-object v2, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->UserRequests:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 254
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    iget-object v1, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->UserRequests:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_26

    .line 256
    return-void

    .line 255
    :cond_26
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "PendingReq"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v1, p0, Lcom/rx201/apkmon/APIHookDialogActivity;->UserRequests:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 254
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d
.end method
