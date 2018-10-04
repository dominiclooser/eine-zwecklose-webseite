


class SequenceAnimation extends HTMLElement {   
    connectedCallback() {
        var x = this
        function showNext() {
            x.innerHTML = Math.floor(Math.random()*1000)
        }
        setInterval(showNext, 800);
    }
}


customElements.define('sequence-animation', SequenceAnimation);