<template>
  <div id="container">
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="signin">Please Sign In</h1>
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">Invalid username and password!</div>
      <div class="alert alert-success" role="alert" v-if="this.$route.query.registration">Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input type="text" id="username" class="form-control" placeholder="Username" v-model="user.username" required autofocus />
      <label for="password" class="sr-only">Password</label>
      <input type="password" id="password" class="form-control" placeholder="Password" v-model="user.password" required />
      <button type="submit">Sign in</button>
      <br>
      <router-link :to="{ name: 'register' }">Need an account?</router-link>
    </form>
  </div>
</div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>

#container {
 padding: 0;
 margin: 0;
 box-sizing: border-box;
}

.form-signin {
  font-family: 'Poppins';
  color: gray;
  position: relative;
  max-width: 260px;
  margin: 200px auto 100px;
  padding: 10px 45px 30px 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.2), 0 5px 5px 0 rgba(0,0,0,0.24);
  
}

a {
  text-decoration: none;
  color: #000;
  padding: 15px;
  text-align: center;
}

a:hover {
  color: gray;

}

.form-control{
  outline: 0;
  border-radius: 5px;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}

.form-control:hover {
  background-color:#fcbaf3;
  transition: all 1s ease 0s;
}

button {
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: gray;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #fff;
  font-size: 14px;
  margin-bottom: 10px;
}

button:hover, button:active, button:focus {
  background-color: #000;
  transition: all 1s ease 0s;
  cursor: pointer;
}

</style>
