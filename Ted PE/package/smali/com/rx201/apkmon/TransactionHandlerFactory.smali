.class Lcom/rx201/apkmon/TransactionHandlerFactory;
.super Ljava/lang/Object;
.source "APIHook.java"


# static fields
.field private static TranslationCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/TransactionHandlerFactory;->TranslationCache:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized TranslateCode(Ljava/lang/String;I)Ljava/lang/String;
    .registers 9
    .param p0, "descriptor"    # Ljava/lang/String;
    .param p1, "Code"    # I

    .prologue
    .line 73
    const-class v5, Lcom/rx201/apkmon/TransactionHandlerFactory;

    monitor-enter v5

    :try_start_3
    sget-object v4, Lcom/rx201/apkmon/TransactionHandlerFactory;->TranslationCache:Ljava/util/Map;

    invoke-interface {v4, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3d

    .line 75
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 76
    .local v3, "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    sget-object v4, Lcom/rx201/apkmon/TransactionHandlerFactory;->TranslationCache:Ljava/util/Map;

    invoke-interface {v4, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_ae

    .line 78
    const/4 v0, 0x0

    .line 80
    .local v0, "cls":Ljava/lang/Class;
    :try_start_16
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "$Stub"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_16 .. :try_end_2c} :catch_b3
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_2c} :catch_b1
    .catchall {:try_start_16 .. :try_end_2c} :catchall_ae

    move-result-object v0

    .line 82
    :goto_2d
    if-nez v0, :cond_33

    .line 85
    :try_start_2f
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_32
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2f .. :try_end_32} :catch_ac
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_32} :catch_b1
    .catchall {:try_start_2f .. :try_end_32} :catchall_ae

    move-result-object v0

    .line 88
    :cond_33
    :goto_33
    if-eqz v0, :cond_3d

    .line 90
    :try_start_35
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 91
    .local v1, "fields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3a
    array-length v4, v1
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_3b} :catch_b1
    .catchall {:try_start_35 .. :try_end_3b} :catchall_ae

    if-lt v2, v4, :cond_5c

    .line 103
    .end local v0    # "cls":Ljava/lang/Class;
    .end local v1    # "fields":[Ljava/lang/reflect/Field;
    .end local v2    # "i":I
    .end local v3    # "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :cond_3d
    :goto_3d
    :try_start_3d
    sget-object v4, Lcom/rx201/apkmon/TransactionHandlerFactory;->TranslationCache:Ljava/util/Map;

    invoke-interface {v4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 104
    .restart local v3    # "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v4

    if-nez v4, :cond_87

    .line 105
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "*UnknownCls "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_59
    .catchall {:try_start_3d .. :try_end_59} :catchall_ae

    move-result-object v4

    .line 111
    :goto_5a
    monitor-exit v5

    return-object v4

    .line 93
    .restart local v0    # "cls":Ljava/lang/Class;
    .restart local v1    # "fields":[Ljava/lang/reflect/Field;
    .restart local v2    # "i":I
    :cond_5c
    :try_start_5c
    aget-object v4, v1, v2

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v4

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v4, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_84

    .line 95
    aget-object v4, v1, v2

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 96
    aget-object v4, v1, v2

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aget-object v6, v1, v2

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_84
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_84} :catch_b1
    .catchall {:try_start_5c .. :try_end_84} :catchall_ae

    .line 91
    :cond_84
    add-int/lit8 v2, v2, 0x1

    goto :goto_3a

    .line 108
    .end local v0    # "cls":Ljava/lang/Class;
    .end local v1    # "fields":[Ljava/lang/reflect/Field;
    .end local v2    # "i":I
    :cond_87
    :try_start_87
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9c

    .line 109
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    goto :goto_5a

    .line 111
    :cond_9c
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "UnknownCode "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_aa
    .catchall {:try_start_87 .. :try_end_aa} :catchall_ae

    move-result-object v4

    goto :goto_5a

    .line 86
    .restart local v0    # "cls":Ljava/lang/Class;
    :catch_ac
    move-exception v4

    goto :goto_33

    .line 73
    .end local v0    # "cls":Ljava/lang/Class;
    .end local v3    # "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :catchall_ae
    move-exception v4

    monitor-exit v5

    throw v4

    .line 100
    .restart local v0    # "cls":Ljava/lang/Class;
    .restart local v3    # "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :catch_b1
    move-exception v4

    goto :goto_3d

    .line 81
    :catch_b3
    move-exception v4

    goto/16 :goto_2d
.end method

.method public static getHandler(Ljava/lang/String;I)Lcom/rx201/apkmon/TransactionHandler;
    .registers 4
    .param p0, "Descriptor"    # Ljava/lang/String;
    .param p1, "Code"    # I

    .prologue
    .line 116
    invoke-static {p0, p1}, Lcom/rx201/apkmon/TransactionHandlerFactory;->TranslateCode(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "TransactionName":Ljava/lang/String;
    const-string v1, "com.android.internal.telephony.ISms"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 120
    const-string v1, "TRANSACTION_sendText"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 121
    new-instance v1, Lcom/rx201/apkmon/SMSSendTextHandler;

    invoke-direct {v1}, Lcom/rx201/apkmon/SMSSendTextHandler;-><init>()V

    .line 154
    :goto_19
    return-object v1

    .line 124
    :cond_1a
    const-string v1, "com.android.internal.telephony.IPhoneSubInfo"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4c

    .line 126
    const-string v1, "TRANSACTION_getLine1Number"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 127
    new-instance v1, Lcom/rx201/apkmon/GetLineNumberHandler;

    invoke-direct {v1}, Lcom/rx201/apkmon/GetLineNumberHandler;-><init>()V

    goto :goto_19

    .line 128
    :cond_30
    const-string v1, "TRANSACTION_getDeviceId"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 129
    new-instance v1, Lcom/rx201/apkmon/GetDeviceIDHandler;

    invoke-direct {v1}, Lcom/rx201/apkmon/GetDeviceIDHandler;-><init>()V

    goto :goto_19

    .line 130
    :cond_3e
    const-string v1, "TRANSACTION_getSubscriberId"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 131
    new-instance v1, Lcom/rx201/apkmon/GetSubscriberIDHander;

    invoke-direct {v1}, Lcom/rx201/apkmon/GetSubscriberIDHander;-><init>()V

    goto :goto_19

    .line 133
    :cond_4c
    const-string v1, "android.app.IApplicationThread"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_62

    .line 135
    const-string v1, "SCHEDULE_RECEIVER_TRANSACTION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 136
    new-instance v1, Lcom/rx201/apkmon/BroadcastReceiverHandler;

    invoke-direct {v1}, Lcom/rx201/apkmon/BroadcastReceiverHandler;-><init>()V

    goto :goto_19

    .line 138
    :cond_62
    const-string v1, "android.content.IContentProvider"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_78

    .line 140
    const-string v1, "QUERY_TRANSACTION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 141
    new-instance v1, Lcom/rx201/apkmon/QueryContentProviderHandler;

    invoke-direct {v1}, Lcom/rx201/apkmon/QueryContentProviderHandler;-><init>()V

    goto :goto_19

    .line 143
    :cond_78
    const-string v1, "android.location.ILocationManager"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 145
    const-string v1, "TRANSACTION_getLastKnownLocation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8e

    .line 146
    new-instance v1, Lcom/rx201/apkmon/LocationGetLastKnownHandler;

    invoke-direct {v1}, Lcom/rx201/apkmon/LocationGetLastKnownHandler;-><init>()V

    goto :goto_19

    .line 147
    :cond_8e
    const-string v1, "TRANSACTION_requestLocationUpdates"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9d

    .line 148
    new-instance v1, Lcom/rx201/apkmon/LocationRequestUpdatesHandler;

    invoke-direct {v1}, Lcom/rx201/apkmon/LocationRequestUpdatesHandler;-><init>()V

    goto/16 :goto_19

    .line 149
    :cond_9d
    const-string v1, "TRANSACTION_requestLocationUpdatesPI"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ac

    .line 150
    new-instance v1, Lcom/rx201/apkmon/LocationRequestUpdatesHandler;

    invoke-direct {v1}, Lcom/rx201/apkmon/LocationRequestUpdatesHandler;-><init>()V

    goto/16 :goto_19

    .line 151
    :cond_ac
    const-string v1, "TRANSACTION_addProximityAlert"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 152
    new-instance v1, Lcom/rx201/apkmon/LocationAddProximityAlertHandler;

    invoke-direct {v1}, Lcom/rx201/apkmon/LocationAddProximityAlertHandler;-><init>()V

    goto/16 :goto_19

    .line 154
    :cond_bb
    const/4 v1, 0x0

    goto/16 :goto_19
.end method
