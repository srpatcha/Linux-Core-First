#include<stdio.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#ifdef __FreeBSD__
#include <errno.h>
#include <kenv.h>
#endif

#define out_of_spec "<OUT OF SPEC>"
static const char *bad_index = "<BAD INDEX>";

#define SUPPORTED_SMBIOS_VER 0x030101

#define FLAG_NO_FILE_OFFSET     (1 << 0)
#define FLAG_STOP_AT_EOT        (1 << 1)

#define FLAG_VERSION            (1 << 0)
#define FLAG_HELP               (1 << 1)
#define FLAG_DUMP               (1 << 2)
#define FLAG_QUIET              (1 << 3)
#define FLAG_DUMP_BIN           (1 << 4)
#define FLAG_FROM_DUMP          (1 << 5)
#define FLAG_NO_SYSFS           (1 << 6)

#define SYS_FIRMWARE_DIR "/sys/firmware/dmi/tables"
#define SYS_ENTRY_FILE SYS_FIRMWARE_DIR "/smbios_entry_point"
#define SYS_TABLE_FILE SYS_FIRMWARE_DIR "/DMI"


/* Options are global */
struct opt
{
        const char *devmem;
        unsigned int flags;
        unsigned char pir;
};

static struct opt opt;

typedef unsigned char u8;
typedef unsigned short u16;
typedef signed short i16;
typedef unsigned int u32;

struct dmi_header
{
        u8 type;
        u8 length;
        u16 handle;
        u8 *data;
};

int is_printable(const u8 *data, int len);

struct dmi_header h;
const char *dmi_string(const struct dmi_header *dm, u8 s);

const char *dmi_string(const struct dmi_header *dm, u8 s)
{
        char *bp = (char *)dm->data;
        size_t i, len;

        if (s == 0)
                return "Not Specified";

        bp += dm->length;
        while (s > 1 && *bp)
        {
                bp += strlen(bp);
                bp++;
                s--;
        }

        if (!*bp)
                return bad_index;

        if (!(opt.flags & FLAG_DUMP))
        {
                /* ASCII filtering */
                len = strlen(bp);
                for (i = 0; i < len; i++)
                        if (bp[i] < 32 || bp[i] == 127)
                                bp[i] = '.';
        }


}

static void dmi_bios_runtime_size(u32 code)
{
        if (code & 0x000003FF)
                printf(" %u bytes", code);
        else
                printf(" %u kB", code >> 10);
}

int main()
{

  //if (h->length < 0x12) break;
  printf("\tVendor: %s\n",         dmi_string(h, data[0x04]));
  printf("\tVersion: %s\n",        dmi_string(h, data[0x05]));
  printf("\tRelease Date: %s\n",   dmi_string(h, data[0x08]));

  printf("System BIOS Information\n");
  if (h->length < 0x08) 
  //printf("\tManufacturer: %s\n",          dmi_string(h, data[0x04]));
  printf("\tProduct Name: %s\n",            dmi_string(h, data[0x05]));
  //printf("\tVersion: %s\n",               dmi_string(h, data[0x06]));
  //printf("\tSerial Number: %s\n",         dmi_string(h, data[0x07]));

  //if (h->length < 0x19)
  //printf("\tUUID: ");
  //dmi_system_uuid(data + 0x08, ver);
  //printf("\n");
  //printf("\tWake-up Type: %s\n", dmi_system_wake_up_type(data[0x18]));

  //if (h->length < 0x1B)
  //printf("\tSKU Number: %s\n",   dmi_string(h, data[0x19]));
  //printf("\tFamily: %s\n",       dmi_string(h, data[0x1A]));
                        
  return 0;
}
