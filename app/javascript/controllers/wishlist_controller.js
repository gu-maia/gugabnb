import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    const csrfToken = document.querySelector("meta[name=csrf-token]").content
    axios.defaults.headers.common['X-CSRF-Token'] = csrfToken
  }
  add_to_wishlist() {
    let response = axios.post('/wishes', { params: { listing_id: this.data.get("listingId")} })
		  .then((response) => {
			  console.log(response.data)
			  let el = document.getElementById('heart-svg')
			  if(response.data.wished) {
                            el.setAttribute('stroke','red')  
			    el.setAttribute('fill','red')
			  } else {
                            el.setAttribute('stroke','currentColor')
			    el.setAttribute('fill','none')
			  }
		  })
  }
}
