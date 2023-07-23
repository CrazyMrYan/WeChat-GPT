import { create } from "zustand";
import { persist } from "zustand/middleware";

export interface AccessControlStore {
  accessCode: string;
  token: string;
  userInfo: {
    id: string,
    name: string,
    openid: string,
    nickname: string,
    headimgurl: string,
  };

  needCode: boolean;

  updateToken: (_: string) => void;
  updateCode: (_: string) => void;
  updateUserInfo: (_: object) => void;
  enabledAccessControl: () => boolean;
  isAuthorized: () => boolean;
  fetch: () => void;
}

export const ACCESS_KEY = "access-control";

let fetchState = 0; // 0 not fetch, 1 fetching, 2 done

export const useAccessStore = create<AccessControlStore>()(
  persist(
    (set, get) => ({
      token: "",
      accessCode: "",
      userInfo: {
        id: "",
        name: "",
        openid: "",
        nickname: "",
        headimgurl: "",
      },
      needCode: true,
      enabledAccessControl() {
        // get().fetch();

        return true;
      },
      updateCode(code: string) {
        set((state) => ({ accessCode: code }));
      },
      updateToken(token: string) {
        set((state) => ({ token }));
      },
      updateUserInfo(userInfo: any) {
        set((state) => ({ userInfo }));
      },
      isAuthorized() {
        // has token or has code or disabled access control
        return (
          !!get().token || !!get().accessCode || !get().enabledAccessControl()
        );
      },
      fetch() {
        if (fetchState > 0) return;
        fetchState = 1;
        fetch("/api/config", {
          method: "post",
          body: null,
        })
          .then((res) => res.json())
          .then((res: DangerConfig) => {
            console.log("[Config] got config from server", res);
            set(() => ({ ...res }));
          })
          .catch(() => {
            console.error("[Config] failed to fetch config");
          })
          .finally(() => {
            fetchState = 2;
          });
      },
    }),
    {
      name: ACCESS_KEY,
      version: 1,
    },
  ),
);
