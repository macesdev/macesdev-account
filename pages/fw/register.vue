<template>
  <div>
    <Head>
      <Title>Hesap Oluştur</Title>
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
              Hesap Oluştur
            </h1>
            <div class="space-y-4 md:space-y-6">
              <div>
                <label
                  for="amail"
                  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >E-Posta</label
                >
                <input
                  v-model="regData.email"
                  id="amail"
                  type="text"
                  class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-emerald-800 dark:focus:border-emerald-500"
                  placeholder="john@macesdev.net"
                  required=""
                />
              </div>
              <div>
                <label
                  for="uname"
                  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >Kullanıcı Adı</label
                >
                <input
                  v-model="regData.uname"
                  id="uname"
                  type="text"
                  placeholder="example"
                  class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-emerald-800 dark:focus:border-emerald-500"
                  required=""
                />
              </div>
              <div>
                <label
                  for="fname"
                  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >Tam Ad</label
                >
                <input
                  v-model="regData.fname"
                  id="fname"
                  type="text"
                  placeholder="M. Ali BULUT"
                  class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-emerald-800 dark:focus:border-emerald-500"
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
                  v-model="regData.pass"
                  id="password"
                  type="password"
                  placeholder="••••••••"
                  class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-emerald-600 focus:border-emerald-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-emerald-800 dark:focus:border-emerald-500"
                  required=""
                />
              </div>
              <div class="flex items-start">
                <div class="flex items-center h-5">
                  <input
                    id="terms"
                    aria-describedby="terms"
                    type="checkbox"
                    class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800"
                    required=""
                  />
                </div>
                <div class="ml-3 text-sm">
                  <label
                    for="terms"
                    class="font-light text-gray-500 dark:text-gray-300"
                    ><a
                      class="font-medium text-primary-600 hover:underline dark:text-primary-500"
                      href="#"
                      >Hüküm ve Koşulları</a
                    >
                    kabul ediyorum.
                  </label>
                </div>
              </div>
              <button
                @click="testBtn"
                class="w-full text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
              >
                Hesap Oluştur
              </button>
              <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                Zaten bir hesabın var mı?
                <NuxtLink to="/fw/login?ref=mnet">
                  <a
                    class="font-medium text-primary-600 hover:underline dark:text-primary-500"
                    >Giriş Yap</a
                  >
                </NuxtLink>
              </p>
            </div>
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
              <span class="font-medium">Kayıt başarılı!</span> ana sayfaya
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

<script>
export default {
  name: "Register",
  data() {
    return {
      regData: {
        email: null,
        uname: null,
        fname: null,
        pass: null,
      },
      errorText: null,
      state: true,
    };
  },
  mounted() {
    if (localStorage.getItem("mail") != null) {
      this.$router.push("/profile");
    }
  },
  methods: {
    async testBtn() {
      console.log(this.regData);

      let req = {
        email: this.regData.email,
        uname: this.regData.uname,
        fname: this.regData.fname,
        pass: this.regData.pass,
      };

      if (
        req.email != null &&
        req.uname != null &&
        req.fname != null &&
        req.pass != null
      ) {
        await this.$server
          .post("/mnet/user/c-new-user", req)
          .then((response) => {
            console.log(response);
            if (response.data.status == "USER_C_SUCCESS") {
              (this.errorText = null), (this.state = false);

              /*
              SAVE TOKEN on LOCAL STORAGE
            */

              localStorage.mail = response.data.mail;
              localStorage.token = response.data.token;

              setTimeout(() => {
                this.$router.push("/");
              }, 2750);
            } else if (response.data.status == "USER_ALREADY_CREATED") {
              this.errorText = "Bu maile kayıtlı bir hesap bulunmakta.";
              this.state = false;
              setTimeout(() => (this.state = !this.state), 2700);
            } else if (response.data.status == "SERVER_ERROR") {
              this.errorText =
                "Sunucu bir hata ile karşılaştı. Sonra tekrar deneyiniz.";
              this.state = false;
              setTimeout(() => (this.state = !this.state), 2700);
            } else if (response.data.status == "UNAME_HAS_INVALID_CHARACTERS") {
              this.errorText = "Kullanıcı adı geçersiz semboller içeriyor.";
              this.state = false;
              setTimeout(() => (this.state = !this.state), 2700);
            } else if (response.data.status == "USERNAME_ALREADY_TAKED") {
              this.errorText = "Bu kullanıcı adına sahip biri var.";
              this.state = false;
              setTimeout(() => (this.state = !this.state), 2750);
            } else if (response.data.status == "INVALID_EMAIL_TYPE") {
              this.errorText = "Geçersiz email düzeni";
              this.state = false;
              setTimeout(() => (this.state = !this.state), 2750);
            }
          });
      } else {
        this.errorText = "Tüm alanlar doldurulmalıdır.";
        this.state = false;
        setTimeout(() => (this.state = !this.state), 2750);
      }

      console.log(this.errorText);
    },
  },
};
</script>
