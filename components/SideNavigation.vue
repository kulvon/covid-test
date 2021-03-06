<template>
  <div ref="Side" class="SideNavigation" tabindex="-1">
    <header class="SideNavigation-Header">
      <v-icon
        class="SideNavigation-OpenIcon"
        :aria-label="$t('サイドメニュー項目を開く')"
        @click="$emit('openNavi', $event)"
      >
        mdi-menu
      </v-icon>
      <h1 class="SideNavigation-HeaderTitle">
        <nuxt-link :to="localePath('/')" class="SideNavigation-HeaderLink">
          <img
            class="SideNavigation-HeaderLogo"
            src="/logo.svg"
            :alt="$t('石川県')"
          />
          <div class="SideNavigation-HeaderText">
            {{ $t('menu/新型コロナウイルス感染症') }}<br />{{
              $t('menu/対策サイト')
            }}
          </div>
        </nuxt-link>
      </h1>
    </header>

    <div :class="['SideNavigation-Body', { '-opened': isNaviOpen }]">
      <v-icon
        class="SideNavigation-CloseIcon"
        :aria-label="$t('サイドメニュー項目を閉じる')"
        @click="$emit('closeNavi', $event)"
      >
        mdi-close
      </v-icon>

      <nav class="SideNavigation-Menu">
        <!-- <div class="SideNavigation-Language">
          <div
            v-if="this.$i18n.locales.length > 1"
            class="SideNavigation-Language"
          >
            <label class="SideNavigation-LanguageLabel" for="LanguageSelector">
              {{ $t('多言語対応選択メニュー') }}
            </label>
            <language-selector />
          </div>
        </div> -->
        <menu-list :items="items" @click="$emit('closeNavi', $event)" />
      </nav>

      <footer class="SideNavigation-Footer">
        <small class="SideNavigation-Copyright">
          {{ $t('このサイトの内容物は') }}
          <a
            :href="$t('https://creativecommons.org/licenses/by/4.0/deed.ja')"
            target="_blank"
            rel="license"
            class="SideNavigation-LicenseLink"
          >
            {{ $t('クリエイティブ・コモンズ 表示 4.0 ライセンス') }}
          </a>
          {{ $t('の下に提供されています。') }}
          <br />
          2020 Ishikawa Prefecture
        </small>
      </footer>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { TranslateResult } from 'vue-i18n'
import LanguageSelector from '@/components/LanguageSelector.vue'
import MenuList from '@/components/MenuList.vue'

type Item = {
  icon?: string
  title: TranslateResult
  link: string
  divider?: boolean
}

export default Vue.extend({
  components: {
    LanguageSelector,
    MenuList
  },
  props: {
    isNaviOpen: {
      type: Boolean,
      required: true
    }
  },
  computed: {
    items(): Item[] {
      return [
        {
          icon: 'GraphIcon',
          title: this.$t('県内の最新感染動向'),
          link: this.localePath('/')
        },
        {
          icon: 'MemoIcon',
          title: this.$t('県内の患者発生状況'),
          link: 'https://www.pref.ishikawa.lg.jp/kansen/coronakennai.html'
        },
        {
          icon: 'MonitorIcon',
          title: this.$t('モニタリング指標'),
          link: 'https://www.pref.ishikawa.lg.jp/kansen/monitoring.html'
        },
        {
          icon: 'BedIcon',
          title: this.$t('病床の確保について'),
          link: 'https://www.pref.ishikawa.lg.jp/kansen/byoushou.html',
          divider: true
        },
        {
          icon: 'VirusIcon',
          title: this.$t('新型コロナウイルス感染症の相談・受診の目安'),
          link: this.localePath('/flow'),
          divider: true
        },
        {
          title: this.$t('知事記者会見等'),
          link: 'https://www.pref.ishikawa.lg.jp/kenmin/covid19/governor_msg.html'
        },
        {
          title: this.$t('健康福祉部長記者会見'),
          link: 'https://www.pref.ishikawa.lg.jp/kansen/kaiken.html'
        },
        {
          title: this.$t('対策本部会議の開催状況'),
          link: 'https://www.pref.ishikawa.lg.jp/kansen/coronataisakuhonbu.html'
        },
        {
          title: this.$t('対策専門家会議の開催状況'),
          link: 'https://www.pref.ishikawa.lg.jp/kansen/senmonkakaigi.html'
        },
        {
          title: this.$t('感染拡大防止に係る取組'),
          link: 'https://www.pref.ishikawa.lg.jp/kenmin/covid19/efforts.html'
        },
        {
          title: this.$t('支援制度'),
          link: 'https://www.pref.ishikawa.lg.jp/kenmin/covid19/support.html'
        },
        {
          title: this.$t('相談窓口一覧'),
          link: 'https://www.pref.ishikawa.lg.jp/kenmin/covid19/documents/contacts.pdf'
        },
        {
          title: this.$t('県民のみなさまへ'),
          link: 'https://www.pref.ishikawa.lg.jp/kenmin/covid19/citizen.html'
        },
        {
          title: this.$t('事業者のみなさまへ'),
          link: 'https://www.pref.ishikawa.lg.jp/kenmin/covid19/biz.html'
        },
        {
          title: this.$t('医療機関のみなさまへ'),
          link: 'https://www.pref.ishikawa.lg.jp/kansen/corona.html#2'
        },
        {
          title: this.$t('感染症対策への応援'),
          link: 'https://www.pref.ishikawa.lg.jp/kenmin/furusatonouzei/coronakifu.html'
        },
        {
          title: this.$t('その他の関連情報'),
          link: 'https://www.pref.ishikawa.lg.jp/kenmin/covid19/others.html'
        },
        {
          title: this.$t('当サイトについて'),
          link: this.localePath('/about')
        },
        {
          title: this.$t('SNSによる情報発信'),
          link: 'https://www.pref.ishikawa.lg.jp/kenmin/covid19/sns.html'
        },
        {
          title: this.$t('石川県公式ホームページ'),
          link: 'https://www.pref.ishikawa.lg.jp/'
        }
      ]
    }
  },
  watch: {
    $route: 'handleChageRoute'
  },
  methods: {
    handleChageRoute() {
      // nuxt-link で遷移するとフォーカスが残り続けるので $route を監視して SideNavigation にフォーカスする
      return this.$nextTick().then(() => {
        const $Side = this.$refs.Side as HTMLEmbedElement | undefined
        if ($Side) {
          $Side.focus()
        }
      })
    }
  }
})
</script>

<style lang="scss" scoped>
.SideNavigation {
  position: relative;
  @include lessThan($small) {
    box-shadow: 0 0 2px rgba(0, 0, 0, 0.15);
  }
  &:focus {
    outline: 1px dotted $gray-3;
  }
}

.SideNavigation-Header {
  height: 64px;
  padding-left: 52px;
  @include largerThan($small) {
    height: auto;
    padding: 20px;
  }
  @include lessThan($small) {
    display: flex;
  }
  @include lessThan($tiny) {
    padding-left: 44px;
  }
}

.SideNavigation-OpenIcon {
  position: absolute;
  top: 0;
  left: 0;
  padding: 18px 8px 18px 16px;
  font-size: 28px;
  @include lessThan($tiny) {
    font-size: 24px;
    padding: 20px 10px;
  }
  @include largerThan($small) {
    display: none;
  }
}

.SideNavigation-CloseIcon {
  position: absolute;
  top: 0;
  left: 0;
  padding: 18px 8px 18px 16px;
  font-size: 28px;
  @include lessThan($tiny) {
    font-size: 24px;
    padding: 20px 10px;
  }
  @include largerThan($small) {
    display: none;
  }
}

.SideNavigation-HeaderTitle {
  width: 100%;
  font-size: 13px;
  color: #707070;
  @include largerThan($small) {
    margin: 0;
    margin-top: 10px;
  }
}

.SideNavigation-HeaderLink {
  display: flex;
  align-items: center;
  padding-right: 10px;
  @include lessThan($small) {
    height: 64px;
  }
  @include lessThan($tiny) {
    justify-content: space-between;
  }
  &:link,
  &:hover,
  &:focus,
  &:visited,
  &:active {
    color: inherit;
    text-decoration: none;
  }

  &:hover,
  &:focus {
    font-weight: bold;
  }

  &:focus {
    outline: dotted $gray-3 1px;
  }

  @include largerThan($small) {
    display: block;
    padding: 15px 0;
  }
}

.SideNavigation-HeaderLogo {
  @include lessThan($tiny) {
    width: 100px;
  }
}

.SideNavigation-HeaderText {
  margin: 10px 0 0 0;
  @include lessThan($small) {
    margin: 0 0 0 10px;
  }

  @include lessThan($tiny) {
    margin: 0;
  }
}

.SideNavigation-Body {
  padding: 0 20px 20px;
  @include lessThan($small) {
    display: none;
    padding: 0 36px 36px;
    &.-opened {
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      display: block !important;
      width: 100%;
      z-index: z-index-of(opened-side-navigation);
      background-color: $white;
      height: 100%;
      overflow: auto;
      -webkit-overflow-scrolling: touch;
    }
  }
}

.SideNavigation-Menu {
  @include lessThan($small) {
    padding-top: 50px;
  }
}

// .SideNavigation-LanguageLabel {
//   display: block;
//   margin-bottom: 5px;
//   font-size: 0.85rem;
// }

.SideNavigation-Footer {
  padding-top: 20px;
}

.SideNavigation-Social {
  display: flex;
}

.SideNavigation-SocialLink {
  border: 1px dotted transparent;
  border-radius: 30px;
  color: $gray-3;

  &:link,
  &:hover,
  &:visited,
  &:active {
    color: inherit;
    text-decoration: none;
  }

  &:focus {
    color: inherit;
    text-decoration: none;
    border: 1px dotted $gray-3;
    outline: none;
  }

  & + & {
    margin-left: 10px;
  }

  img {
    width: 30px;
  }
}

.SideNavigation-Copyright {
  display: block;
  margin-top: 15px;
  color: $gray-1;
  font-size: 10px;
  line-height: 1.3;
  font-weight: bold;
}

.SideNavigation-LicenseLink {
  &:focus {
    outline: 1px dotted $gray-3;
  }
}
</style>
