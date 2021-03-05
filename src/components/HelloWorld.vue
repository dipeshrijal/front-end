<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <p><a href="https://cli.vuejs.org" target="_blank" rel="noopener"></a></p>
    {{ data }}
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "HelloWorld",
  data() {
    return {
      data: "",
    };
  },
  props: {
    msg: String,
  },
  async mounted() {
    // let url = process.env.URL || "localhost:4000";
    const data = await axios.get(
      `http://back-end-drijal-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com/users`
    );
    this.data = data.data;
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
