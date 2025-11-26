<template>
  <span v-if="modelValue">{{ modelValue }}</span>
  <div v-else class="highlight-yellow p-1">
    <input
      class="form-control form-control-sm"
      :type="type"
      :placeholder="placeholder"
      :aria-label="ariaLabel"
      v-model="internalValue"
      @input="$emit('update:modelValue', internalValue)"
    />
  </div>
</template>

<script setup>
import { ref, watch } from "vue";

const props = defineProps({
  modelValue: String | Number,
  type: { type: String, default: "text" },
  placeholder: String,
  ariaLabel: String,
});

const internalValue = ref(props.modelValue);
watch(
  () => props.modelValue,
  (val) => (internalValue.value = val)
);
</script>
