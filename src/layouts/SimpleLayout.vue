<template>
  <header>
    <NavBar />
    <!-- Banner Principal -->
    <section class="banner-custom mt-4">
      <div class="w-100 mx-auto px-0 py-5 my-5">
        <div class="row align-items-center">
          <div class="col-12">
            <router-view />
          </div>
        </div>
      </div>
    </section>
  </header>
  <footer class="align-content-center">
    <Footer />
  </footer>
</template>
<script setup>
import NavBar from "../components/Navbar.vue";
import Footer from "../components/Footer.vue";
</script>
<style scoped>
.banner-custom {
  width: 100vw -1;
  height: 100vh -2;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  background: linear-gradient(135deg, var(--footer-bg) 0%, var(--dark) 100%);
  padding: 5rem 0;
  position: relative;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.banner-custom::before {
  content: "";
  position: absolute;
  inset: 0; /* shorthand para top, right, bottom, left = 0 */
  background-image: url("../assets/img/banner.webp");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  opacity: 0.5;
  z-index: 0;
}
.banner-custom > .w-75 {
  position: relative;
  z-index: 1;
}
</style>
