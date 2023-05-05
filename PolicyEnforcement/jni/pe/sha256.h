#ifndef PE_SHA256_H_
#define PE_SHA256_H_

typedef struct {
   unsigned char data[64];
   unsigned int datalen;
   unsigned int bitlen[2];
   unsigned int state[8];
} SHA256_CTX;

void sha256_init(SHA256_CTX *ctx);
void sha256_update(SHA256_CTX *ctx, unsigned char data[], unsigned int len);
void sha256_final(SHA256_CTX *ctx, unsigned char hash[]);

#endif /* PE_SHA256_H_ */
