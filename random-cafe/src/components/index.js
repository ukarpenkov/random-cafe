import CafeCard from './CafeCard.vue'

const components = [
  { name: 'CafeCard', component: CafeCard }
]

export default {
  install(app) {
    components.forEach(({ name, component }) => {
      app.component(name, component)
    })
  }
}