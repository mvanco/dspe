.class public final enum Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;
.super Ljava/lang/Enum;
.source "APIHook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rx201/apkmon/RemotePermissionChecker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RemoteType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum Activity:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

.field private static final synthetic ENUM$VALUES:[Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

.field public static final enum Service:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 946
    new-instance v0, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    const-string v1, "Service"

    invoke-direct {v0, v1, v2}, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->Service:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    new-instance v0, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    const-string v1, "Activity"

    invoke-direct {v0, v1, v3}, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->Activity:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    sget-object v1, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->Service:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->Activity:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->ENUM$VALUES:[Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 946
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    return-object v0
.end method

.method public static values()[Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->ENUM$VALUES:[Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    array-length v1, v0

    new-array v2, v1, [Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
