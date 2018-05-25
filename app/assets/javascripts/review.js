class Review {
  constructor(review){
    this.id = review.id
    this.body = review.body
    this.user = review.user.email
  }
}

Review.prototype.renderReviewBody = function(){
  return `<div id="review"><strong>${this.user}</strong><p>${this.body}</p></div>`
}
