.class Lcom/rx201/apkmon/APIHookDialogActivity$2;
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

.field private final synthetic val$tvIpInfo:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/rx201/apkmon/APIHookDialogActivity;Landroid/widget/TextView;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    iput-object p2, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2;->val$tvIpInfo:Landroid/widget/TextView;

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 16

    .prologue
    const/4 v11, 0x0

    .line 85
    :try_start_1
    new-instance v10, Ljava/net/URL;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "http://kb.bothunter.net/ipInfo/IPRep.php?IP="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v13, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    # getter for: Lcom/rx201/apkmon/APIHookDialogActivity;->CurUserRequest:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;
    invoke-static {v13}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$1(Lcom/rx201/apkmon/APIHookDialogActivity;)Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    move-result-object v13

    invoke-virtual {v13}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->getRemoteIP()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "&FORMAT=TAB"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v12}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 86
    .local v10, "url":Ljava/net/URL;
    invoke-virtual {v10}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    .line 88
    .local v5, "conn":Ljava/net/URLConnection;
    new-instance v9, Ljava/io/BufferedReader;

    new-instance v12, Ljava/io/InputStreamReader;

    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v9, v12}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 89
    .local v9, "rd":Ljava/io/BufferedReader;
    const-string v8, ""

    .line 90
    .local v8, "line":Ljava/lang/String;
    const-string v4, ""

    .line 91
    .local v4, "alllines":Ljava/lang/String;
    :goto_3b
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_8a

    .line 94
    const-string v3, "Unknown"

    .line 95
    .local v3, "THREAT_LEVEL":Ljava/lang/String;
    const-string v2, "Unknown"

    .line 96
    .local v2, "THREAT_CATEGORY":Ljava/lang/String;
    const-string v0, "Unknown"

    .line 97
    .local v0, "COUNTRY":Ljava/lang/String;
    const-string v12, "\t"

    invoke-virtual {v4, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    array-length v13, v12

    :goto_4e
    if-lt v11, v13, :cond_9c

    .line 106
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_6b

    .line 107
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, " ("

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ")"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 108
    :cond_6b
    const-string v11, "Threat Level: %s%s\r\nCountry: %s"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v12, v13

    const/4 v13, 0x1

    aput-object v2, v12, v13

    const/4 v13, 0x2

    aput-object v0, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "IpDesc":Ljava/lang/String;
    iget-object v11, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2;->val$tvIpInfo:Landroid/widget/TextView;

    new-instance v12, Lcom/rx201/apkmon/APIHookDialogActivity$2$1;

    iget-object v13, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2;->val$tvIpInfo:Landroid/widget/TextView;

    invoke-direct {v12, p0, v13, v1}, Lcom/rx201/apkmon/APIHookDialogActivity$2$1;-><init>(Lcom/rx201/apkmon/APIHookDialogActivity$2;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 124
    .end local v0    # "COUNTRY":Ljava/lang/String;
    .end local v1    # "IpDesc":Ljava/lang/String;
    .end local v2    # "THREAT_CATEGORY":Ljava/lang/String;
    .end local v3    # "THREAT_LEVEL":Ljava/lang/String;
    .end local v4    # "alllines":Ljava/lang/String;
    .end local v5    # "conn":Ljava/net/URLConnection;
    .end local v8    # "line":Ljava/lang/String;
    .end local v9    # "rd":Ljava/io/BufferedReader;
    .end local v10    # "url":Ljava/net/URL;
    :goto_89
    return-void

    .line 92
    .restart local v4    # "alllines":Ljava/lang/String;
    .restart local v5    # "conn":Ljava/net/URLConnection;
    .restart local v8    # "line":Ljava/lang/String;
    .restart local v9    # "rd":Ljava/io/BufferedReader;
    .restart local v10    # "url":Ljava/net/URL;
    :cond_8a
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3b

    .line 97
    .restart local v0    # "COUNTRY":Ljava/lang/String;
    .restart local v2    # "THREAT_CATEGORY":Ljava/lang/String;
    .restart local v3    # "THREAT_LEVEL":Ljava/lang/String;
    :cond_9c
    aget-object v7, v12, v11

    .line 99
    .local v7, "item":Ljava/lang/String;
    const-string v14, "THREAT_LEVEL"

    invoke-virtual {v7, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_af

    .line 100
    const/16 v14, 0xd

    invoke-virtual {v7, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 97
    :cond_ac
    :goto_ac
    add-int/lit8 v11, v11, 0x1

    goto :goto_4e

    .line 101
    :cond_af
    const-string v14, "THREAT_CATEGORY"

    invoke-virtual {v7, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_be

    .line 102
    const/16 v14, 0x10

    invoke-virtual {v7, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_ac

    .line 103
    :cond_be
    const-string v14, "COUNTRY"

    invoke-virtual {v7, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_ac

    .line 104
    const/16 v14, 0x8

    invoke-virtual {v7, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_cb
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_cb} :catch_cd

    move-result-object v0

    goto :goto_ac

    .line 115
    .end local v0    # "COUNTRY":Ljava/lang/String;
    .end local v2    # "THREAT_CATEGORY":Ljava/lang/String;
    .end local v3    # "THREAT_LEVEL":Ljava/lang/String;
    .end local v4    # "alllines":Ljava/lang/String;
    .end local v5    # "conn":Ljava/net/URLConnection;
    .end local v7    # "item":Ljava/lang/String;
    .end local v8    # "line":Ljava/lang/String;
    .end local v9    # "rd":Ljava/io/BufferedReader;
    .end local v10    # "url":Ljava/net/URL;
    :catch_cd
    move-exception v6

    .line 117
    .local v6, "e":Ljava/io/IOException;
    iget-object v11, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2;->val$tvIpInfo:Landroid/widget/TextView;

    new-instance v12, Lcom/rx201/apkmon/APIHookDialogActivity$2$2;

    iget-object v13, p0, Lcom/rx201/apkmon/APIHookDialogActivity$2;->val$tvIpInfo:Landroid/widget/TextView;

    invoke-direct {v12, p0, v13}, Lcom/rx201/apkmon/APIHookDialogActivity$2$2;-><init>(Lcom/rx201/apkmon/APIHookDialogActivity$2;Landroid/widget/TextView;)V

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    goto :goto_89
.end method
