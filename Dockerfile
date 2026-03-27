FROM runpod/worker-comfyui:5.5.1-base

# Install custom nodes
RUN comfy node install --exit-on-fail comfyui-gguf@1.1.10 --mode remote

# ----------- MODELS -----------

# LoRAs (FIXED)
RUN comfy model download --url https://huggingface.co/yeqiu168182/DR34ML4Y_I2V_14B_HIGH/resolve/main/DR34ML4Y_I2V_14B_HIGH.safetensors \
    --relative-path models/loras --filename DR34ML4Y_I2V_14B_HIGH.safetensors

RUN comfy model download --url https://huggingface.co/rahul7star/wan2.2Lora/resolve/main/DR34ML4Y_I2V_14B_LOW.safetensors \
    --relative-path models/loras --filename DR34ML4Y_I2V_14B_LOW.safetensors

# CLIP (FIXED PATH)
RUN comfy model download --url https://huggingface.co/NSFW-API/NSFW-Wan-UMT5-XXL/resolve/main/nsfw_wan_umt5-xxl_fp8_scaled.safetensors \
    --relative-path models/clip --filename nsfw_wan_umt5-xxl_fp8_scaled.safetensors

# VAE
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors \
    --relative-path models/vae --filename wan_2.1_vae.safetensors

# GGUF UNET
RUN comfy model download --url https://huggingface.co/rgomezs2010/loras_wan/resolve/main/wan22EnhancedNSFWSVICamera_nsfwV2Q8High.gguf \
    --relative-path models/unet --filename wan22EnhancedNSFWSVICamera_nsfwV2Q8High.gguf

RUN comfy model download --url https://huggingface.co/rgomezs2010/loras_wan/resolve/main/wan22EnhancedNSFWSVICamera_nsfwV2Q8Low.gguf \
    --relative-path models/unet --filename wan22EnhancedNSFWSVICamera_nsfwV2Q8Low.gguf

# Optional input
# COPY input/ /comfyui/input/