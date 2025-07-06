#!/bin/bash
# Aplica as configurações que você pediu ao phobos_defconfig

CONFIG_FILE="phobos_defconfig"

# Configurações para setar (chave=valor)
declare -A configs_to_set=(
  ["CONFIG_LOCALVERSION_AUTO"]="# CONFIG_LOCALVERSION_AUTO is not set"
  ["CONFIG_KERNEL_LZMA"]="CONFIG_KERNEL_LZMA=y"
  ["CONFIG_AUDIT"]="CONFIG_AUDIT=y"
  ["CONFIG_NO_HZ"]="CONFIG_NO_HZ=y"
  ["CONFIG_HIGH_RES_TIMERS"]="CONFIG_HIGH_RES_TIMERS=y"
  ["CONFIG_IKCONFIG"]="CONFIG_IKCONFIG=y"
  ["CONFIG_CGROUPS"]="CONFIG_CGROUPS=y"
  ["CONFIG_CGROUP_DEBUG"]="CONFIG_CGROUP_DEBUG=y"
  ["CONFIG_CGROUP_FREEZER"]="CONFIG_CGROUP_FREEZER=y"
  ["CONFIG_CGROUP_CPUACCT"]="CONFIG_CGROUP_CPUACCT=y"
  ["CONFIG_RESOURCE_COUNTERS"]="CONFIG_RESOURCE_COUNTERS=y"
  ["CONFIG_CGROUP_SCHED"]="CONFIG_CGROUP_SCHED=y"
  ["CONFIG_RT_GROUP_SCHED"]="CONFIG_RT_GROUP_SCHED=y"
  ["CONFIG_BLK_DEV_INITRD"]="CONFIG_BLK_DEV_INITRD=y"
  ["CONFIG_PANIC_TIMEOUT"]="CONFIG_PANIC_TIMEOUT=5"
  ["CONFIG_ELF_CORE"]="# CONFIG_ELF_CORE is not set"
  ["CONFIG_EMBEDDED"]="CONFIG_EMBEDDED=y"
  ["CONFIG_SLAB"]="CONFIG_SLAB=y"
  ["CONFIG_PROFILING"]="CONFIG_PROFILING=y"
  ["CONFIG_OPROFILE"]="CONFIG_OPROFILE=y"
  ["CONFIG_ARCH_MMAP_RND_BITS"]="CONFIG_ARCH_MMAP_RND_BITS=16"
  ["CONFIG_CMDLINE"]="CONFIG_CMDLINE=\"console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw init=/init\""
  ["CONFIG_CMDLINE_FORCE"]="CONFIG_CMDLINE_FORCE=y"
)

# Faz backup
cp "$CONFIG_FILE" "$CONFIG_FILE.bak"

for key in "${!configs_to_set[@]}"; do
  # Remove linhas que setam a chave
  sed -i "/^CONFIG_${key}=/d" "$CONFIG_FILE"
  sed -i "/^# CONFIG_${key} is not set/d" "$CONFIG_FILE"

  # Adiciona a linha desejada no final
  echo "${configs_to_set[$key]}" >> "$CONFIG_FILE"
done

