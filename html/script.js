const boilerApp = Vue.createApp({
    data() {
        // This is where you define your variables used in the HTML
        return {
            scoreboardOpened: false, // this will toggle visibility
            players: [], // this is a placeholder for a list of players
            ids: [], // this is a placeholder for a list of player ids
            police_count: 0,
            ems_count: 0,
            mechanic_count: 0,
            house_robberies_count: 0,
            total_players: 0,
        };
    },
    methods: {
        // This is where your traditional JS functions go
        // https://vuejs.org/guide/essentials/methods.html
        handleKeydown(event) {
            if (event.key === "Escape") {
                this.closeApplication();
            }
        },
        closeApplication() {
            // if you'd rather not use axios, you can use fetch as shown below
            // fetch(`https://${GetParentResourceName()}/closeApp`, { method: "POST", headers: { "Content-Type": "application/json; charset=UTF-8" }, body: JSON.stringify({ inputValue: this.inputValue }) });
            axios.post(`https://${GetParentResourceName()}/close`, { scoreboardOpened: this.scoreboardOpened });
            this.scoreboardOpened = false;
        },
    },
    mounted() {
        // This is where you will add your event listeners
        // https://vuejs.org/guide/instance.html#Lifecycle-Diagram
        document.addEventListener("keydown", this.handleKeydown);

        window.addEventListener("message", (event) => {
            switch (event.data.action) {
                case "open":
                    this.scoreboardOpened = true;
                    break;
                case "close":
                    this.scoreboardOpened = false;
                    break;
                case "updateScoreboardData":
                    this.scoreboardOpened = true;
                    this.players = event.data.players;
                    this.ids = event.data.ids;
                    this.police_count = event.data.police_count;
                    this.ems_count = event.data.ems_count;
                    this.mechanic_count = event.data.mechanic_count;
                    this.total_players = event.data.total_players;
                    break;
            }
        });
    },
    beforeUnmount() {
        // This is where you will remove your event listeners
        // https://vuejs.org/guide/instance.html#Lifecycle-Diagram
        document.removeEventListener("keydown", this.handleKeydown);
    },
}).mount("#app");
