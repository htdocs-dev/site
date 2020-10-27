---
title: From Vuejs 2.0
---

## Concepts


```ts
<template>
  <div>
    <button>Counter</button>>
  </div>
</template>  
<script>
  import { onMounted, computed, ref, watch } from 'vue'
  export default {
    props: {
      status: {type: string, default: ''}
    },
    data() {},
    setup(props, context) {
      
      onMounted(() => {

      })

      const counter = ref(0) // make counter reactive using a proxy
      const increment = () => counter.value++

      watch(counter, current => {})

      const arrayOfItems = computer(() => {

      })

      return { counter, increment } // accessible in template
    }
  }
</script>

```

### Lifecycle Hooks


### Composition API

`setup`
1. Props
2. Setup
3. Component created


`onMounted`


`watch`



`computed`

### Reactivity

Js Proxy (ES6)

`reactive`

```vue
 const obj = reactive({...})
```

`ref`

reactive for a simple type

`toRefs`

deconstruct 

`customRef`

can be used to check / validate values


### Teleport

Outside the compnents tree component


### Vue dependency injection

`provide` / `inject`

```vue
<script> // propertyProvider
  import { provide } from 'vue'

  export default {
    setup() {
      const property = reactive({
        ...
      })

      provide('key', property)

      watch(property, property => {

      })
    }
  }
</script>


<script> // action
  import { inject } from 'vue'

  setup() {
    const property = inject('property', defaultValue?)

    return { property }
  }

</script>

<script> // action
  import { inject } from 'vue'

  setup() {
    const property = inject('property', defaultValue?)

    return { property }
  }

</script>

```

`context`

## Vuex 4

Can be replaced by `reactive(const state = {})` for simple use cases

```js
import { createStore } from "vuex";

export default createStore({
  state: {},
  mutations: {},
  actions: {},
  modules: {}
});
```

```js
import router from "./router";

createApp(App)
  .use(store)
  .use(router)
  .mount("#app");

```


## Router

```js
import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
import Home from "../views/Home.vue";

const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/about",
    name: "About",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/About.vue")
  }
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

export default router;

```


## Typescript

`shims-vue-d-ts` import component by default

## Vitejs

