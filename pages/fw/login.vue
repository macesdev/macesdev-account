<template>
  <div>
    <Head>
      <Title>Giriş Yap</Title>
    </Head>
  </div>

  <section class="bg-gray-50 dark:bg-gray-900">
    <div v-if="state">
      <div
        class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0"
      >
        <div
          class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700"
        >
          <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
            <h1
              class="text-xl text-center font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white"
            >
              Giriş Yap
            </h1>
            <div>
              <label
                for="text"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                >E-Posta
              </label>
              <input
                v-model="loginData.email"
                type="email"
                name="text"
                id="text"
                class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-emerald-800 dark:focus:border-emerald-500"
                placeholder=""
                required=""
              />
            </div>
            <div>
              <label
                for="password"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                >Şifre</label
              >
              <input
                v-model="loginData.pass"
                type="password"
                name="password"
                id="password"
                placeholder="••••••••"
                class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-emerald-500 dark:focus:border-emerald-500"
                required=""
              />
            </div>
            <div class="flex items-center justify-between">
              <a
                href="#"
                class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500"
                >Şifremi Unuttum</a
              >
            </div>
            <button
              @click="signIn"
              type="submit"
              class="w-full text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
            >
              Giriş Yap
            </button>
            <p class="text-sm font-light text-gray-500 dark:text-gray-400">
              Hala hesabın yok mu?
              <NuxtLink to="/fw/register?ref=mnet">
                <a
                  class="font-medium text-primary-600 hover:underline dark:text-primary-500"
                  >Hesap Oluştur</a
                >
              </NuxtLink>
            </p>
          </div>
        </div>
      </div>
    </div>

    <div v-if="!state">
      <div v-if="errorText == null">
        <div
          class="flex flex-col items-center justify-center px-4 py-4 mx-auto md:h-screen lg:py-0"
        >
          <div
            class="flex p-4 mb-4 text-sm text-green-800 rounded-lg bg-green-50 dark:bg-gray-800 dark:text-green-400"
            role="alert"
          >
            <svg
              aria-hidden="true"
              class="flex-shrink-0 inline w-5 h-5 mr-3"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                fill-rule="evenodd"
                d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                clip-rule="evenodd"
              ></path>
            </svg>
            <span class="sr-only">Info</span>
            <div>
              <span class="font-medium">Giriş başarılı!</span> ana sayfaya
              yönlendirileceksiniz..
            </div>
          </div>
        </div>
      </div>

      <div v-if="errorText != null">
        <div
          class="flex flex-col items-center justify-center px-4 py-4 mx-auto md:h-screen lg:py-0"
        >
          <div
            class="flex p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400"
            role="alert"
          >
            <svg
              aria-hidden="true"
              class="flex-shrink-0 inline w-5 h-5 mr-3"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                fill-rule="evenodd"
                d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                clip-rule="evenodd"
              ></path>
            </svg>
            <span class="sr-only">Info</span>
            <div>
              {{ errorText }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style>
.content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>

<script>
export default {
  name: "LoginPage",
  data() {
    return {
      loginData: {
        email: null,
        pass: null,
      },
      state: true,
      errorText: null,
    };
  },
  beforeMount() {
    if (localStorage.getItem("mail") != null) {
      this.$router.push("/");
    }
  },
  methods: {
    async signIn() {
      if (this.loginData.email != null && this.loginData.pass != null) {
        await this.$server
          .post("/mnet/user/login-user", this.loginData)
          .then((response) => {
            console.log(response);

            if (response.data.status == "LOGIN_SUCCESS") {
              (this.errorText = null), (this.state = false);

              localStorage.mail = response.data.mail;
              localStorage.token = response.data.token;

              setTimeout(() => {
                navigateTo("/");
              }, 2750);
            } else if (response.data.status == "USER_NOT_FOUND") {
              this.errorText = "Bu mail adresine kayıtlı kimse yok!";
              this.state = false;
              setTimeout(() => (this.state = !this.state), 2750);
            } else if (response.data.status == "INVALID_DATAS") {
              this.errorText = "INVALID_DATAS";
              this.state = false;
              setTimeout(() => (this.state = !this.state), 2750);
            } else if (response.data.status == "PASSWORDS_NOT_MATCH") {
              this.errorText = "Şifreniz uyuşmuyor!";
              this.state = false;
              setTimeout(() => (this.state = !this.state), 2750);
            } else if (response.data.status == "SERVER_ERROR") {
              (this.errorText =
                "Sunucu hata ile karşılaştı. Daha sonra tekrar deneyiniz!"),
                (this.state = false);
              setTimeout(() => (this.errorText = !this.errorText), 2750);
            }
          });
      }
    },
  },
};
</script>
