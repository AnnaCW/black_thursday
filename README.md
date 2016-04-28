
## Black Thursday

A business is only as smart as its data. We've built a system able to load, parse, search, and execute business intelligence queries against the data from a typical e-commerce business.

## Project Overview

### Learning Goals

* Use tests to drive both the design and implementation of code
* Decompose a large application into components
* Use test fixtures instead of actual data when testing
* Connect related objects together through references
* Learn an agile approach to building software

## Key Concepts

From a technical perspective, this project emphasizes:

* File I/O
* Relationships between objects
* Encapsulating Responsibilities
* Light data / analytics

Everything is tied together with one common root, a SalesEngine instance, which is initialized like this:

```ruby
se = SalesEngine.from_csv({
  :items => "./data/items.csv",
  :merchants => "./data/merchants.csv",
  :invoices => "./data/invoices.csv",
  :invoice_items => "./data/invoice_items.csv",
  :transactions => "./data/transactions.csv",
  :customers => "./data/customers.csv"
})
```


Find the [project spec here](https://github.com/turingschool/curriculum/blob/master/source/projects/black_thursday.markdown).
