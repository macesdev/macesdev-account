<script setup>
import { onMounted } from "vue";
import { Modal } from "flowbite";
onMounted(() => {
  const $buttonElement = document.querySelector("#button");
  const $modalElement = document.querySelector("#modal");
  const $closeButton = document.querySelector("#closeButton");
  const modalOptions = {
    backdropClasses:
      "bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40",
  };
  if ($modalElement) {
    const modal = new Modal($modalElement, modalOptions);
    $buttonElement.addEventListener("click", () => modal.toggle());
    $closeButton.addEventListener("click", () => modal.hide());

    // programatically show
    // modal.show();
  }
});
</script>

<template>
  <div id="wrapper">
    <div>
      <Head>
        <Title>Profilim</Title>
        <Style
          type="text/css"
          children="body { background-color: #111827; }"
        ></Style>
      </Head>
    </div>

    <div
      id="model"
      tabindex="-1"
      aria-hidden="true"
      class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-modal md:h-full"
    >
      <div class="relative w-full h-full max-w-md md:h-auto">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
          <button
            type="button"
            class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
            data-modal-hide="model"
          >
            <svg
              aria-hidden="true"
              class="w-5 h-5"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                fill-rule="evenodd"
                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                clip-rule="evenodd"
              ></path>
            </svg>
            <span id="closeButton" class="sr-only">Close modal</span>
          </button>
          <div class="px-6 py-6 lg:px-8">
            <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">
              Kimliğini Doğrula
            </h3>
            <div>
              <label
                for="password"
                class="block text-sm font-medium mb-2 text-gray-900 dark:text-white"
                >Şifre</label
              >
              <input
                type="password"
                v-model="updatePassword"
                name="password"
                id="upassword"
                placeholder="••••••••"
                class="bg-gray-50 border border-gray-300 mb-4 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                required
              />
            </div>
            <div class="flex justify-between">
              <div class="flex items-start"></div>
            </div>
            <button
              type="submit"
              @click="updateUserData"
              class="w-full text-white bg-blue-700 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
            >
              Doğrula
            </button>
          </div>
        </div>
      </div>
    </div>

    <div v-if="dataLoaded == true">
      <div class="sidebar">
        <ProfileSidebar />
      </div>

      <div class="p-4 sm:ml-64">
        <section class="bg-white dark:bg-gray-900">
          <div class="py-8 px-4 mx-auto max-w-2xl lg:py-16">
            <div
              class="flex pb-0 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600"
            >
              <h3
                class="text-2xl mb-4 font-semibold text-gray-900 dark:text-white"
              >
                Kişisel Bilgiler
              </h3>
            </div>
            <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
              <div class="sm:col-span-2">
                <label
                  for="name"
                  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >Durum</label
                >
                <input
                  v-model="userData.status"
                  type="text"
                  name="name"
                  id="name"
                  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Ne hissediyorsun?"
                  required=""
                />
              </div>
              <div class="w-full">
                <label
                  for="username"
                  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >Kullanıcı Adı</label
                >
                <div class="w-full flex">
                  <span
                    class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"
                  >
                    @
                  </span>
                  <input
                    v-model="userData.uname"
                    type="text"
                    id="username"
                    class="rounded-none rounded-r-lg bg-gray-50 border text-gray-900 focus:ring-emerald-500 focus:border-emerald-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-emerald-500 dark:focus:border-emerald-500"
                    placeholder="michael"
                  />
                </div>
              </div>
              <div class="w-full">
                <label
                  for="price"
                  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >E-Posta</label
                >
                <div class="relative">
                  <div
                    class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none"
                  >
                    <svg
                      aria-hidden="true"
                      class="w-5 h-5 text-gray-500 dark:text-gray-400"
                      fill="currentColor"
                      viewBox="0 0 20 20"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"
                      ></path>
                      <path
                        d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"
                      ></path>
                    </svg>
                  </div>
                  <input
                    v-model="userData.mail"
                    type="text"
                    id="input-group-1"
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-emerald-500 dark:focus:border-emerald-500"
                    placeholder="michael@macesdev.net"
                  />
                </div>
              </div>

              <div class="w-full">
                <label
                  for="fullanme"
                  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >Tam Ad</label
                >
                <input
                  type="text"
                  name="fullname"
                  v-model="userData.fname"
                  id="fullname"
                  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Tam Ad"
                  required=""
                />
              </div>
              <div class="w-full">
                <label
                  for="perm"
                  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >Yetki</label
                >
                <input
                  disabled
                  type="perm"
                  name="perm"
                  id="perm"
                  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Üye"
                  required=""
                />
              </div>

              <div class="sm:col-span-2">
                <label
                  for="description"
                  class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >Hakkımda</label
                >
                <textarea
                  id="description"
                  v-model="userData.about"
                  rows="2"
                  class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Buralarda okudum ben.."
                ></textarea>
              </div>
            </div>
            <button
              @click="updatePassword = null"
              data-modal-target="model"
              data-modal-toggle="model"
              id="button"
              class="w-full text-center items-center px-5 py-2.5 mt-4 sm:mt-6 text-sm font-medium text-white bg-primary-700 rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800"
            >
              Güncelle
            </button>
          </div>
        </section>
      </div>
    </div>

    <div class="loadingScreen" v-if="dataLoaded == false">
      <div role="status">
        <svg
          aria-hidden="true"
          class="inline w-10 h-10 mr-2 text-gray-200 animate-spin dark:text-gray-600 fill-primary-600"
          viewBox="0 0 100 101"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
            fill="currentColor"
          />
          <path
            d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
            fill="currentFill"
          />
        </svg>
        <span class="sr-only">Loading...</span>
      </div>
    </div>
  </div>
</template>

<style>
.wrapper {
  height: 100%;
}

.loadingScreen {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-right: -50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
</style>

<script>
export default {
  name: "Profile",

  data() {
    return {
      updatePassword: null,
      dataLoaded: false,
      userData: {
        status: null,
        uname: null,
        mail: null,
        about: null,
        level: 1,
      },
    };
  },
  beforeMount() {
    if (localStorage.getItem("mail") == null) {
      navigateTo("/fw/login");
    }

    console.log("created");
  },
  mounted() {
    /* THEME APPLY */
    /*if (
      localStorage.theme === "dark" ||
      (!("theme" in localStorage) &&
        window.matchMedia("(prefers-color-scheme: dark)").matches)
    ) {
      document.documentElement.classList.add("dark");
    } else {
      document.documentElement.classList.remove("dark");
    }*/

    const route = useRouter();

    let request = {
      email: localStorage.getItem("mail"),
      token: localStorage.getItem("token"),
    };

    console.log(route);
    this.$server
      .post("/mnet/user/profile/get-user-data", request)
      .then((response) => {
        console.log(response.data);

        if (response.data.status == "INVALID_DATAS") {
          localStorage.removeItem("mail");
          localStorage.removeItem("token");
          navigateTo("/fw/login");
        } else if (response.data.status == "SUCCESS") {
          this.userData = response.data.userData;
          console.log(this.userData);
          this.dataLoaded = !this.dataLoaded;
        } else if (response.data.status == "SERVER_ERROR") {
          alert("Sunucuda hata var, daha sonra tekrar deneyiniz.");
          navigateTo("/");
        }
      });
  },
  methods: {
    updateUserData() {
      let request = {
        pass: this.updatePassword,
        newData: this.userData,
        mail: localStorage.getItem("mail"),
      };

      axios;
      this.$server
        .post(
          "http://localhost:3333/mnet/user/profile/update-user-data",
          request
        )
        .then((response) => {
          console.log(response);
        });
    },
  },
};
</script>
