<template>
  <div class="row">
    <div class="container">
      <button class="btn btn-primary">{{ message }}</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'welcome',
  data () {
    return {
      message: 'Hello world'
    }
  },
  mounted () {
    console.log('welcome view has loaded')
  }
}
</script>
