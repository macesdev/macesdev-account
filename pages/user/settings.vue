<template>
  <div>
    <Head>
      <Title>Ayarlar</Title>
      <Style
        type="text/css"
        children="body { background-color: #111827; }"
      ></Style>
    </Head>
  </div>

  <ProfileSidebar />

  <div class="p-4 sm:ml-64">
    <section class="bg-white dark:bg-gray-900">
      <div class="py-8 px-4 mx-auto max-w-2xl lg:py-16">
        <div
          class="flex pb-0 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600"
        >
          <h3 class="text-2xl mb-4 font-semibold text-gray-900 dark:text-white">
            Ayarlar
          </h3>
        </div>
        <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
          <div class="sm:col-span-2">
            <label
              for="name"
              class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
              >API Referansı</label
            >
            <input
              disabled
              type="text"
              name="name"
              id="name"
              class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
              placeholder="https://api.macesdev.net/v1/"
              required=""
            />
          </div>
          <div class="w-full">
            <label
              for="username"
              class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
              >Tema</label
            >

            <label class="relative inline-flex items-center cursor-pointer">
              <input
                type="checkbox"
                @click="changeTheme"
                value=""
                v-model="checked"
                class="sr-only peer"
              />
              <div
                class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-primary-300 dark:peer-focus:ring-primary-800 dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-primary-600"
              ></div>
              <span
                class="ml-3 text-sm font-medium text-gray-900 dark:text-gray-300"
                >{{ getTheme }} Tema</span
              >
            </label>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: "Settings",
  data() {
    return {
      checked: false,
    };
  },
  computed: {
    getTheme() {
      if (this.checked == false) {
        return "Koyu"
      } else { 
        return "Açık"
      }
    }
  },
  mounted() {
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
       document.documentElement.classList.add('dark')
       this.checked = false;
    } else {
       document.documentElement.classList.remove('dark')
       this.checked = true;
    }
  },
  methods: {
    changeTheme() {
      if (this.checked == true) {
        localStorage.theme = 'light'
      } else {
        localStorage.theme = 'dark'
      }

      this.checked = !this.checked;
      

      
    },
  },
};
</script>
