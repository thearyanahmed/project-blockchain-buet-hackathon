<style type="text/css" scoped>
    ul {
      list-style: none;
    }
    li a {
      margin: auto 10px;
    }
</style>
<template>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <ul class="nav nav-tabs">
          <li class="active"><a data-toggle="tab" href="#home">New Post</a></li>
          <li><a data-toggle="tab" href="#menu1">Properties</a></li>
          <li><a data-toggle="tab" href="#menu2">Requests</a></li>
        </ul>
        <div class="tab-content">
          <div id="home" class="tab-pane fade in active">
            <h3>New Post</h3>
            <form method="POST" >
              <div class="form-group">
                <label></label>
                <input type="text" v-model="postdata.title" required>
              </div>
              <div class="form-group">
                <label></label>
                <input type="text" v-model="postdata.title" required>
              </div>
            </form> 
          </div>
          <div id="menu1" class="tab-pane fade">
            <h3>Properties</h3>
          </div>
          <div id="menu2" class="tab-pane fade">
            <h3>Requests</h3>
            <p>Some content in menu 2.</p>
          </div>
        </div>
      </div>  
     </div>
  </div>
</template>

<script>
export default {
  name: 'welcome',
  data () {
    return {
      postdata: {
        title: null,
        amount: null,
        interest: null
      }
    }
  },
  mounted () {
    console.log('welcome view has loaded')
  }
}
</script>
