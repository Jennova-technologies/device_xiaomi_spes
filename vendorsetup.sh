# ROM source patches

color="\033[0;32m"
end="\033[0m"

echo -e "${color}Applying patches${end}"
sleep 1

# Remove pixel headers to avoid conflicts
rm -rf hardware/google/pixel/kernel_headers/Android.bp

# Remove hardware/lineage/compat to avoid conflicts
rm -rf hardware/lineage/compat/Android.bp

# Kernel & Vendor Sources
git clone --depth=1 https://github.com/Jennova-technologies/vendor_xiaomi_spes -b 16-Infinity vendor/xiaomi/spes
git clone --depth=1 https://github.com/Jennova-technologies/vendor_xiaomi_spes -b 16-Infinity kernel/xiaomi/sm6225

# Hardware/Xiaomi
rm -fr hardware/xiaomi
git clone https://github.com/Jennova-technologies/hardware_xiaomi hardware/xiaomi

# Debug Tools
#git clone https://github.com/spes-development/hardware_samsung-extra_interfaces -b lineage-22 hardware/samsung-ext/interfaces

# Sepolicy fix for imsrcsd
echo -e "${color}Switch back to legacy imsrcsd sepolicy${end}"
rm -rf device/qcom/sepolicy_vndr/legacy-um/qva/vendor/bengal/ims/imsservice.te
cp device/qcom/sepolicy_vndr/legacy-um/qva/vendor/bengal/legacy-ims/hal_rcsservice.te device/qcom/sepolicy_vndr/legacy-um/qva/vendor/bengal/ims/hal_rcsservice.te

