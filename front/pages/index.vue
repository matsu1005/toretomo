<template>
  <div>
    <add-plan-btn />
    <header-carousel />
    <filter-plan />
    <plan-card />
  </div>
</template>

<script>
import HeaderCarousel from "~/components/HeaderCarousel.vue"
import FilterPlan from "~/components/FilterPlan.vue"
import PlanCard from "~/components/PlanCard.vue"
import AddPlanBtn from "~/components/AddPlanBtn.vue"

export default {
  components: {
    HeaderCarousel,
    FilterPlan,
    PlanCard,
    AddPlanBtn,
  },
}
</script>
