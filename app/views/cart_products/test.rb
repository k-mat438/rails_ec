<div class="col-sm-6">
<%= f.label :last_name, "Last name", class:"form-label" %>
<%= f.text_field :last_name, class: "form-control" %>
<div class="invalid-feedback">
  Valid last name is required.
</div>
</div>
<div class="col-12">
<%= f.label :username, class: "form-label"%>
<div class="input-group has-validation">
  <span class="input-group-text">@</span>
  <%= f.text_field :username, class: "form-control", placeholder:"Username"%>
  <div class="invalid-feedback">
    Your username is required.
  </div>
</div>
</div>
<div class="col-12">
<%#<label for="email" class="form-label">Email <span class="text-body-secondary">(Optional)</span></label>
<input type="email" class="form-control" id="email" placeholder="you@example.com">%>
<%= f.label :email, "Email", class:"form-label" %>
<%= f.text_field :email, class: "form-control", placeholder: "you@example.com" %>
<div class="invalid-feedback">
  Please enter a valid email address for shipping updates.
</div>
</div>
<div class="col-12">
<%#<label for="address" class="form-label">Address</label>
<input type="text" class="form-control" id="address" placeholder="1234 Main St" required>%>
<%= f.label :address1, "Address", class:"form-label" %>
<%= f.text_field :address1, class: "form-control", placeholder:"1234 Main St" %>
<div class="invalid-feedback">
  Please enter your shipping address.
</div>
</div>
<div class="col-12">
<%#<label for="address2" class="form-label">Address 2 <span class="text-body-secondary">(Optional)</span></label>
<input type="text" class="form-control" id="address2" placeholder="Apartment or suite">%>
<%= f.label :address2, "Address 2 (Optional)", class:"form-label" %>
<%= f.text_field :address2, class: "form-control", placeholder:"Apartment or suite" %>
</div>
<%#
<div class="col-md-5">
<%= f.label :country, "Country", class:"form-label"
<select class="form-select" id="country" required>
  <option value="">Choose...</option>
  <option>United States</option>
</select>
<%#= f.select :country, class:"form-select"
<div class="invalid-feedback">
  Please select a valid country.
</div>
</div>
<div class="col-md-4">
<%= f.label :state, "State", class:"form-label"
<select class="form-select" id="state" required>
  <option value="">Choose...</option>
  <option>California</option>
</select>
<div class="invalid-feedback">
  Please provide a valid state.
</div>
</div>
<div class="col-md-3">
<%= f.label :zip, "Zip", class:"form-label"
<%= f.text_field :zip, class: "form-control"
<div class="invalid-feedback">
  Zip code required.
</div>
</div>
%>

</div>
<hr class="my-4">
<div class="form-check">
<input type="checkbox" class="form-check-input" id="same-address">
<label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
</div>
<div class="form-check">
<input type="checkbox" class="form-check-input" id="save-info">
<label class="form-check-label" for="save-info">Save this information for next time</label>
</div>
<hr class="my-4">
<h4 class="mb-3">Payment</h4>
<div class="my-3">
<div class="form-check">
<input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
<label class="form-check-label" for="credit">Credit card Only</label>
</div>
<%#<div class="form-check">
<input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
<label class="form-check-label" for="debit">Debit card</label>
</div>
<div class="form-check">
<input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
<label class="form-check-label" for="paypal">PayPal</label>
</div>%>
</div>
<div class="row gy-3">
<div class="col-md-6">
<%= f.label :name_on_card, "Name on card", class:"form-label" %>
<%= f.text_field :name_on_card, class:"form-control" %>
<small class="text-body-secondary">Full name as displayed on card</small>
<div class="invalid-feedback">
  Name on card is required
</div>
</div>
<div class="col-md-6">
<%= f.label :cart_number, "Credit card number", class:"form-label" %>
<%= f.text_field :cart_number, class:"form-control" %>
<div class="invalid-feedback">
  Credit card number is required
</div>
</div>
<div class="col-md-3">
<%= f.label :expiration, "Expiration", class:"form-label" %>
<%= f.text_field :expiration, class:"form-control" %>
<div class="invalid-feedback">
  Expiration date required
</div>
</div>
<div class="col-md-3">
<%= f.label :cvv, "CVV", class:"form-label" %>
<%= f.text_field :cvv, class:"form-control" %>
<div class="invalid-feedback">
  Security code required
</div>
</div>
</div>
