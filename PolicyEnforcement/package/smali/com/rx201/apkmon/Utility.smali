.class Lcom/rx201/apkmon/Utility;
.super Ljava/lang/Object;
.source "APIHook.java"


# static fields
.field private static AM_getDefault:Ljava/lang/reflect/Method; = null

.field private static AM_startActivity:Ljava/lang/reflect/Method; = null

.field private static AM_startService:Ljava/lang/reflect/Method; = null

.field static final AppPackageName:Ljava/lang/String;

.field static final ConsentDialogActivityName:Ljava/lang/String;

.field private static DecisionsLoaded:Z = false

.field private static IfAM:Ljava/lang/Class; = null

.field static final LocalConsentDialogName:Landroid/content/ComponentName;

.field private static SavedDecisions:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static final SecurittManagerService:Ljava/lang/String; = "com.rx201.asm.PermissionCheck"

.field static final SecurityManagerIntent:Landroid/content/Intent;

.field static final SecurityManagerPackage:Ljava/lang/String; = "com.rx201.asm"

.field private static clsAMN:Ljava/lang/Class;

.field private static cls_IApplicationThread:Ljava/lang/Class;

.field private static pfd:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 681
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->AppPackageName:Ljava/lang/String;

    .line 682
    const-class v0, Lcom/rx201/apkmon/APIHookDialogActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->ConsentDialogActivityName:Ljava/lang/String;

    .line 683
    new-instance v0, Landroid/content/ComponentName;

    sget-object v1, Lcom/rx201/apkmon/Utility;->AppPackageName:Ljava/lang/String;

    sget-object v2, Lcom/rx201/apkmon/Utility;->ConsentDialogActivityName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/rx201/apkmon/Utility;->LocalConsentDialogName:Landroid/content/ComponentName;

    .line 686
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 687
    const-string v1, "com.rx201.asm"

    const-string v2, "com.rx201.asm.PermissionCheck"

    .line 686
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->SecurityManagerIntent:Landroid/content/Intent;

    .line 732
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    .line 733
    const/4 v0, 0x0

    sput-boolean v0, Lcom/rx201/apkmon/Utility;->DecisionsLoaded:Z

    .line 830
    const/4 v0, 0x0

    sput-object v0, Lcom/rx201/apkmon/Utility;->clsAMN:Ljava/lang/Class;

    .line 849
    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 680
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized LogAccess(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p0, "PolicyName"    # Ljava/lang/String;
    .param p1, "PolicyUID"    # Ljava/lang/String;

    .prologue
    .line 722
    const-class v2, Lcom/rx201/apkmon/Utility;

    monitor-enter v2

    :try_start_3
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v1, Ljava/io/FileWriter;

    const-string v3, "/sdcard/access.txt"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 723
    .local v0, "out":Ljava/io/BufferedWriter;
    const-string v1, "%s %s: %s %s\n"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 724
    const-string v5, "yyyy-MM-dd hh:mm:ss"

    invoke-static {v5}, Lcom/rx201/apkmon/Utility;->now(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    .line 725
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    .line 726
    aput-object p0, v3, v4

    const/4 v4, 0x3

    if-eqz p1, :cond_3d

    .end local p1    # "PolicyUID":Ljava/lang/String;
    :goto_2f
    aput-object p1, v3, v4

    .line 723
    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 727
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3b} :catch_43
    .catchall {:try_start_3 .. :try_end_3b} :catchall_40

    .line 730
    .end local v0    # "out":Ljava/io/BufferedWriter;
    :goto_3b
    monitor-exit v2

    return-void

    .line 726
    .restart local v0    # "out":Ljava/io/BufferedWriter;
    .restart local p1    # "PolicyUID":Ljava/lang/String;
    :cond_3d
    :try_start_3d
    const-string p1, ""
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_3f} :catch_43
    .catchall {:try_start_3d .. :try_end_3f} :catchall_40

    goto :goto_2f

    .line 722
    .end local v0    # "out":Ljava/io/BufferedWriter;
    .end local p1    # "PolicyUID":Ljava/lang/String;
    :catchall_40
    move-exception v1

    monitor-exit v2

    throw v1

    .line 728
    :catch_43
    move-exception v1

    goto :goto_3b
.end method

.method private static LookupSavedPolicyDecision(Ljava/lang/String;Ljava/lang/String;)I
    .registers 11
    .param p0, "PolicyName"    # Ljava/lang/String;
    .param p1, "PolicyUID"    # Ljava/lang/String;

    .prologue
    .line 737
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 739
    .local v3, "key":Ljava/lang/String;
    sget-object v7, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    monitor-enter v7

    .line 740
    :try_start_14
    sget-boolean v6, Lcom/rx201/apkmon/Utility;->DecisionsLoaded:Z

    if-nez v6, :cond_4d

    .line 741
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/rx201/apkmon/APIHook;->loadDecisions(Ljava/lang/String;)[B

    move-result-object v0

    .line 742
    .local v0, "data":[B
    if-eqz v0, :cond_4a

    .line 744
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_2f
    .catchall {:try_start_14 .. :try_end_2f} :catchall_65

    .line 746
    .local v2, "in":Ljava/io/ByteArrayInputStream;
    :try_start_2f
    new-instance v4, Ljava/io/ObjectInputStream;

    invoke-direct {v4, v2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 747
    .local v4, "objIn":Ljava/io/ObjectInputStream;
    sget-object v6, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->clear()V

    .line 748
    sget-object v8, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    invoke-virtual {v8, v6}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 749
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->close()V

    .line 750
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_4a} :catch_5a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2f .. :try_end_4a} :catch_68
    .catchall {:try_start_2f .. :try_end_4a} :catchall_65

    .line 757
    .end local v2    # "in":Ljava/io/ByteArrayInputStream;
    .end local v4    # "objIn":Ljava/io/ObjectInputStream;
    :cond_4a
    :goto_4a
    const/4 v6, 0x1

    :try_start_4b
    sput-boolean v6, Lcom/rx201/apkmon/Utility;->DecisionsLoaded:Z

    .line 759
    .end local v0    # "data":[B
    :cond_4d
    sget-object v6, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 739
    .local v5, "r":Ljava/lang/Integer;
    monitor-exit v7

    .line 761
    if-nez v5, :cond_73

    .line 762
    const/4 v6, -0x2

    .line 764
    :goto_59
    return v6

    .line 751
    .end local v5    # "r":Ljava/lang/Integer;
    .restart local v0    # "data":[B
    .restart local v2    # "in":Ljava/io/ByteArrayInputStream;
    :catch_5a
    move-exception v1

    .line 752
    .local v1, "e":Ljava/io/IOException;
    const-string v6, "apkmon"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4a

    .line 739
    .end local v0    # "data":[B
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "in":Ljava/io/ByteArrayInputStream;
    :catchall_65
    move-exception v6

    monitor-exit v7
    :try_end_67
    .catchall {:try_start_4b .. :try_end_67} :catchall_65

    throw v6

    .line 753
    .restart local v0    # "data":[B
    .restart local v2    # "in":Ljava/io/ByteArrayInputStream;
    :catch_68
    move-exception v1

    .line 754
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    :try_start_69
    const-string v6, "apkmon"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_72
    .catchall {:try_start_69 .. :try_end_72} :catchall_65

    goto :goto_4a

    .line 764
    .end local v0    # "data":[B
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .end local v2    # "in":Ljava/io/ByteArrayInputStream;
    .restart local v5    # "r":Ljava/lang/Integer;
    :cond_73
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_59
.end method

.method public static LowlevelStartActivity(Landroid/content/Intent;)Z
    .registers 10
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 854
    :try_start_2
    invoke-static {}, Lcom/rx201/apkmon/Utility;->resolveClasses()V

    .line 855
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    if-nez v4, :cond_51

    .line 858
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xe

    if-ge v4, v5, :cond_146

    .line 859
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startActivity"

    const/16 v6, 0xa

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    .line 860
    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-class v8, [Landroid/net/Uri;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-class v8, Landroid/os/IBinder;

    aput-object v8, v6, v7

    const/4 v7, 0x6

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x8

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x9

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    .line 859
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    .line 880
    :cond_51
    :goto_51
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_getDefault:Ljava/lang/reflect/Method;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 881
    .local v1, "mAm":Ljava/lang/Object;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xe

    if-ge v4, v5, :cond_a4

    .line 882
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    const/16 v5, 0xa

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v6, 0x2

    invoke-virtual {p0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 883
    :cond_a4
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-ge v4, v5, :cond_102

    .line 884
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    const/16 v5, 0xd

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v6, 0x2

    invoke-virtual {p0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0xb

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 885
    :cond_102
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x12

    if-ge v4, v5, :cond_273

    .line 886
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    const/16 v5, 0xa

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v6, 0x2

    invoke-virtual {p0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const/4 v7, 0x0

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 894
    .end local v1    # "mAm":Ljava/lang/Object;
    :goto_145
    return v2

    .line 861
    :cond_146
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-ge v4, v5, :cond_1cf

    .line 863
    const-string v4, "android.os.ParcelFileDescriptor"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    .line 864
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startActivity"

    const/16 v6, 0xd

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    .line 865
    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-class v8, [Landroid/net/Uri;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-class v8, Landroid/os/IBinder;

    aput-object v8, v6, v7

    const/4 v7, 0x6

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x8

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x9

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0xa

    .line 866
    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0xb

    sget-object v8, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0xc

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    .line 864
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;
    :try_end_1a8
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1a8} :catch_1aa

    goto/16 :goto_51

    .line 891
    :catch_1aa
    move-exception v0

    .line 892
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "apkmon"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "exception: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    .line 893
    const-string v2, "apkmon"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    move v2, v3

    .line 894
    goto/16 :goto_145

    .line 867
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1cf
    :try_start_1cf
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x12

    if-ge v4, v5, :cond_221

    .line 868
    const-string v4, "android.os.ParcelFileDescriptor"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    .line 869
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startActivity"

    const/16 v6, 0xa

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    .line 870
    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-class v8, Landroid/os/IBinder;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x6

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x7

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x8

    .line 871
    sget-object v8, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x9

    const-class v8, Landroid/os/Bundle;

    aput-object v8, v6, v7

    .line 869
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    goto/16 :goto_51

    .line 873
    :cond_221
    const-string v4, "android.os.ParcelFileDescriptor"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    .line 874
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startActivity"

    const/16 v6, 0xb

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    .line 875
    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    const-class v8, Landroid/os/IBinder;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x6

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x8

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x9

    .line 876
    sget-object v8, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0xa

    const-class v8, Landroid/os/Bundle;

    aput-object v8, v6, v7

    .line 874
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    goto/16 :goto_51

    .line 888
    .restart local v1    # "mAm":Ljava/lang/Object;
    :cond_273
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    const/16 v5, 0xb

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x2

    aput-object p0, v5, v6

    const/4 v6, 0x3

    invoke-virtual {p0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const/4 v7, 0x0

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2b5
    .catch Ljava/lang/Exception; {:try_start_1cf .. :try_end_2b5} :catch_1aa

    goto/16 :goto_145
.end method

.method public static LowlevelStartService(Landroid/content/Intent;)Z
    .registers 10
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 902
    :try_start_2
    invoke-static {}, Lcom/rx201/apkmon/Utility;->resolveClasses()V

    .line 904
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startService:Ljava/lang/reflect/Method;

    if-nez v4, :cond_25

    .line 906
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startService"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startService:Ljava/lang/reflect/Method;

    .line 908
    :cond_25
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_getDefault:Ljava/lang/reflect/Method;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 909
    .local v1, "mAm":Ljava/lang/Object;
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startService:Ljava/lang/reflect/Method;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v6, 0x2

    const/4 v7, 0x0

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_40} :catch_41

    .line 915
    .end local v1    # "mAm":Ljava/lang/Object;
    :goto_40
    return v2

    .line 912
    :catch_41
    move-exception v0

    .line 913
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "apkmon"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "exception: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    .line 914
    const-string v2, "apkmon"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    move v2, v3

    .line 915
    goto :goto_40
.end method

.method public static declared-synchronized PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z
    .registers 9
    .param p0, "permission"    # Lcom/rx201/apkmon/permissions/AurasiumPermission;

    .prologue
    const/4 v4, 0x1

    .line 797
    const-class v5, Lcom/rx201/apkmon/Utility;

    monitor-enter v5

    const/4 v1, 0x0

    .line 798
    .local v1, "decision":I
    :try_start_5
    invoke-static {}, Lcom/rx201/apkmon/Utility;->isASMAvailable()Z

    move-result v6

    if-eqz v6, :cond_33

    .line 799
    new-instance v0, Lcom/rx201/apkmon/RemotePermissionChecker;

    .line 800
    sget-object v6, Lcom/rx201/apkmon/Utility;->SecurityManagerIntent:Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v6

    sget-object v7, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->Service:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    .line 799
    invoke-direct {v0, p0, v6, v7}, Lcom/rx201/apkmon/RemotePermissionChecker;-><init>(Lcom/rx201/apkmon/permissions/AurasiumPermission;Landroid/content/ComponentName;Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;)V

    .line 801
    .local v0, "checker":Lcom/rx201/apkmon/RemotePermissionChecker;
    invoke-virtual {v0}, Lcom/rx201/apkmon/RemotePermissionChecker;->check()I

    move-result v1

    .line 822
    .end local v0    # "checker":Lcom/rx201/apkmon/RemotePermissionChecker;
    :cond_1c
    :goto_1c
    const/4 v6, -0x1

    if-ne v1, v6, :cond_2f

    .line 823
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 824
    const-string v7, "Application termination at user\'s request."

    .line 823
    invoke-static {v6, v7}, Lcom/rx201/apkmon/APIHook;->LOG_I(Ljava/lang/String;Ljava/lang/String;)V

    .line 825
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->KillMe()V
    :try_end_2f
    .catchall {:try_start_5 .. :try_end_2f} :catchall_5c

    .line 827
    :cond_2f
    if-ne v1, v4, :cond_5f

    :goto_31
    monitor-exit v5

    return v4

    .line 803
    :cond_33
    :try_start_33
    invoke-virtual {p0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->getPermissionIdentifier()Ljava/lang/String;

    move-result-object v2

    .line 804
    .local v2, "permissionName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->getGroupingIdentifier()Ljava/lang/String;

    move-result-object v3

    .line 805
    .local v3, "permissionUID":Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/rx201/apkmon/Utility;->LogAccess(Ljava/lang/String;Ljava/lang/String;)V

    .line 807
    invoke-static {v2, v3}, Lcom/rx201/apkmon/Utility;->LookupSavedPolicyDecision(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 808
    const/4 v6, -0x2

    if-ne v1, v6, :cond_1c

    .line 810
    new-instance v0, Lcom/rx201/apkmon/RemotePermissionChecker;

    .line 811
    sget-object v6, Lcom/rx201/apkmon/Utility;->LocalConsentDialogName:Landroid/content/ComponentName;

    sget-object v7, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->Activity:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    .line 810
    invoke-direct {v0, p0, v6, v7}, Lcom/rx201/apkmon/RemotePermissionChecker;-><init>(Lcom/rx201/apkmon/permissions/AurasiumPermission;Landroid/content/ComponentName;Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;)V

    .line 815
    .restart local v0    # "checker":Lcom/rx201/apkmon/RemotePermissionChecker;
    invoke-virtual {v0}, Lcom/rx201/apkmon/RemotePermissionChecker;->check()I

    move-result v1

    .line 817
    invoke-virtual {v0}, Lcom/rx201/apkmon/RemotePermissionChecker;->getExtraResult()I

    move-result v6

    if-eqz v6, :cond_1c

    .line 818
    invoke-static {v2, v3, v1}, Lcom/rx201/apkmon/Utility;->SavePolicyDecision(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_5b
    .catchall {:try_start_33 .. :try_end_5b} :catchall_5c

    goto :goto_1c

    .line 797
    .end local v0    # "checker":Lcom/rx201/apkmon/RemotePermissionChecker;
    .end local v2    # "permissionName":Ljava/lang/String;
    .end local v3    # "permissionUID":Ljava/lang/String;
    :catchall_5c
    move-exception v4

    monitor-exit v5

    throw v4

    .line 827
    :cond_5f
    const/4 v4, 0x0

    goto :goto_31
.end method

.method private static SavePolicyDecision(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 10
    .param p0, "PolicyName"    # Ljava/lang/String;
    .param p1, "PolicyUID"    # Ljava/lang/String;
    .param p2, "decision"    # I

    .prologue
    .line 770
    const/4 v4, -0x1

    if-ne p2, v4, :cond_4

    .line 788
    :goto_3
    return-void

    .line 772
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 773
    .local v1, "key":Ljava/lang/String;
    sget-object v5, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    monitor-enter v5

    .line 774
    :try_start_18
    sget-object v4, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 777
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_26
    .catchall {:try_start_18 .. :try_end_26} :catchall_4b

    .line 779
    .local v3, "out":Ljava/io/ByteArrayOutputStream;
    :try_start_26
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v3}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 780
    .local v2, "objOut":Ljava/io/ObjectOutputStream;
    sget-object v4, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-virtual {v2, v4}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 781
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V

    .line 782
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-static {v4, v6}, Lcom/rx201/apkmon/APIHook;->saveDecisions(Ljava/lang/String;[B)V

    .line 783
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_49} :catch_4e
    .catchall {:try_start_26 .. :try_end_49} :catchall_4b

    .line 773
    .end local v2    # "objOut":Ljava/io/ObjectOutputStream;
    :goto_49
    :try_start_49
    monitor-exit v5

    goto :goto_3

    .end local v3    # "out":Ljava/io/ByteArrayOutputStream;
    :catchall_4b
    move-exception v4

    monitor-exit v5
    :try_end_4d
    .catchall {:try_start_49 .. :try_end_4d} :catchall_4b

    throw v4

    .line 784
    .restart local v3    # "out":Ljava/io/ByteArrayOutputStream;
    :catch_4e
    move-exception v0

    .line 785
    .local v0, "e":Ljava/io/IOException;
    :try_start_4f
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_52
    .catchall {:try_start_4f .. :try_end_52} :catchall_4b

    goto :goto_49
.end method

.method private static isASMAvailable()Z
    .registers 4

    .prologue
    .line 690
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    .line 691
    .local v1, "executor":Ljava/util/concurrent/ExecutorService;
    new-instance v3, Lcom/rx201/apkmon/Utility$1;

    invoke-direct {v3}, Lcom/rx201/apkmon/Utility$1;-><init>()V

    invoke-interface {v1, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 703
    .local v2, "result":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Boolean;>;"
    :try_start_d
    invoke-interface {v2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_16} :catch_18
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_d .. :try_end_16} :catch_1e

    move-result v3

    .line 709
    :goto_17
    return v3

    .line 704
    :catch_18
    move-exception v0

    .line 705
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 709
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_1c
    const/4 v3, 0x0

    goto :goto_17

    .line 706
    :catch_1e
    move-exception v0

    .line 707
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_1c
.end method

.method public static now(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "dateFormat"    # Ljava/lang/String;

    .prologue
    .line 713
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 714
    .local v0, "cal":Ljava/util/Calendar;
    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-direct {v1, p0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 715
    .local v1, "sdf":Ljava/text/SimpleDateFormat;
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static resolveClasses()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 838
    sget-object v0, Lcom/rx201/apkmon/Utility;->clsAMN:Ljava/lang/Class;

    if-nez v0, :cond_27

    .line 840
    const-string v0, "android.app.ActivityManagerNative"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->clsAMN:Ljava/lang/Class;

    .line 841
    sget-object v0, Lcom/rx201/apkmon/Utility;->clsAMN:Ljava/lang/Class;

    const-string v1, "getDefault"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->AM_getDefault:Ljava/lang/reflect/Method;

    .line 843
    const-string v0, "android.app.IActivityManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    .line 844
    const-string v0, "android.app.IApplicationThread"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    .line 846
    :cond_27
    return-void
.end method
