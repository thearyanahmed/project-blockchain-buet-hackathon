<template>
  <div class="row">
    <div class="container">
      <button class="btn btn-primary">{{ message }}</button>
      <router-link tag="li" to="/welcome">
        <a>/home</a>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'test',
  data () {
    return {
      message: 'Hello world'
    }
  },
  mounted () {
    console.log('mew')
  }
}
</script>
